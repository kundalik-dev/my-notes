# Jenkinsfile Structure — Industry Standards

## Minimal Required Jenkinsfile

Every Jenkinsfile must have at minimum: `pipeline`, `agent`, and `stages` with at least one `stage` and `steps`.

```groovy
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'npm ci'
            }
        }
    }
}
```

---

## Full Industry-Standard Jenkinsfile (All Options)

```groovy
pipeline {

    // ─── 1. AGENT ───────────────────────────────────────────────────────────
    agent {
        docker {
            image 'mcr.microsoft.com/playwright:v1.52.0-noble'
            args '-u root'
        }
    }

    // ─── 2. OPTIONS ─────────────────────────────────────────────────────────
    options {
        timestamps()                        // add timestamp to every log line
        timeout(time: 30, unit: 'MINUTES')  // kill build if it exceeds 30 min
        disableConcurrentBuilds()           // prevent parallel runs of same job
        buildDiscarder(logRotator(numToKeepStr: '10'))  // keep last 10 builds
        retry(2)                            // retry entire pipeline on failure
    }

    // ─── 3. ENVIRONMENT VARIABLES ───────────────────────────────────────────
    environment {
        APP_ENV     = 'staging'
        BASE_URL    = 'https://staging.example.com'
        API_TOKEN   = credentials('api-token-credential-id')  // from Jenkins credentials store
        BUILD_TAG   = "${env.BUILD_NUMBER}-${env.GIT_COMMIT[0..6]}"
    }

    // ─── 4. PARAMETERS (manual trigger inputs) ──────────────────────────────
    parameters {
        string(name: 'BRANCH',      defaultValue: 'main',    description: 'Branch to build')
        booleanParam(name: 'SMOKE', defaultValue: true,      description: 'Run smoke tests?')
        choice(name: 'ENV',         choices: ['staging', 'production'], description: 'Target env')
    }

    // ─── 5. TRIGGERS ────────────────────────────────────────────────────────
    triggers {
        cron('H 2 * * 1-5')          // scheduled: every weekday at ~2 AM
        pollSCM('H/5 * * * *')       // poll git every 5 minutes for changes
        // githubPush()              // trigger on GitHub webhook push (needs plugin)
    }

    // ─── 6. TOOLS ────────────────────────────────────────────────────────────
    tools {
        nodejs 'NodeJS-18'    // must match name in Jenkins > Global Tool Configuration
        // maven 'Maven-3.9'
        // jdk   'JDK-17'
    }

    // ─── 7. STAGES ───────────────────────────────────────────────────────────
    stages {

        stage('Checkout') {
            steps {
                checkout scm   // checks out code from the configured SCM (Git)
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm ci'    // use 'npm ci' (not npm install) for reproducible installs
            }
        }

        stage('Lint') {
            steps {
                sh 'npm run lint'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Unit Tests') {
            steps {
                sh 'npm run test:unit'
            }
            post {
                always {
                    junit 'test-results/unit/*.xml'   // publish JUnit results
                }
            }
        }

        stage('E2E Tests') {
            when {
                expression { params.SMOKE == true }   // run only if parameter is true
            }
            parallel {
                stage('Chromium') {
                    steps { sh 'npx playwright test --project=chromium' }
                }
                stage('Firefox') {
                    steps { sh 'npx playwright test --project=firefox' }
                }
            }
        }

        stage('Deploy to Staging') {
            when {
                branch 'main'    // run only on main branch
            }
            steps {
                sh './scripts/deploy.sh staging'
            }
        }

        stage('Deploy to Production') {
            when {
                branch 'main'
            }
            steps {
                input message: 'Approve deployment to production?', ok: 'Deploy'
                sh './scripts/deploy.sh production'
            }
        }
    }

    // ─── 8. POST ─────────────────────────────────────────────────────────────
    post {
        always {
            publishHTML(target: [
                reportDir: 'playwright-report',
                reportFiles: 'index.html',
                reportName: 'Playwright Report'
            ])
            archiveArtifacts artifacts: 'test-results/**/*', allowEmptyArchive: true
            cleanWs()   // clean workspace after every build
        }
        success {
            slackSend channel: '#ci', color: 'good',
                message: "Build passed: ${env.JOB_NAME} #${env.BUILD_NUMBER} - ${env.BUILD_URL}"
        }
        failure {
            mail to: 'team@example.com',
                subject: "FAILED: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                body: "Check console: ${env.BUILD_URL}"
            slackSend channel: '#ci', color: 'danger',
                message: "Build FAILED: ${env.JOB_NAME} #${env.BUILD_NUMBER} - ${env.BUILD_URL}"
        }
        unstable {
            slackSend channel: '#ci', color: 'warning',
                message: "Build UNSTABLE: ${env.JOB_NAME} #${env.BUILD_NUMBER}"
        }
    }
}
```

---

## Section-by-Section Reference

### 1. `agent` — **Required**
Defines where the pipeline runs. Add this when you need to control the execution environment.

| Option | When to Use |
|---|---|
| `agent any` | Use any available Jenkins node — fine for simple setups |
| `agent none` | Declare agent per stage — use when stages need different environments |
| `agent { label 'linux' }` | Target a specific node by label |
| `agent { docker { image '...' } }` | Run inside a Docker container — best for consistent, isolated builds |
| `agent { kubernetes { ... } }` | Run in a Kubernetes pod — use in cloud-native / large-scale CI |

---

### 2. `options` — Recommended
Global job behaviors. Add this to every production pipeline.

| Option | When to Add |
|---|---|
| `timestamps()` | Always — helps debug by showing when each step ran |
| `timeout(...)` | Always — prevents hung builds from blocking agents forever |
| `disableConcurrentBuilds()` | When your tests share a database, environment, or port |
| `buildDiscarder(...)` | Always — prevents disk from filling up with old build logs |
| `retry(n)` | When running on flaky infrastructure (rare — prefer per-step retry) |

---

### 3. `environment` — Recommended
Centralizes config and secrets. Add when you have values used across multiple stages.

| Usage | When to Add |
|---|---|
| Plain value `KEY = 'value'` | Config shared across stages (base URLs, env names) |
| `credentials('id')` | Secrets — API tokens, passwords (never hardcode these) |
| Dynamic value `"${expr}"` | Build metadata — commit hash, build tag, timestamps |

---

### 4. `parameters` — Optional
Adds user-input fields when triggering a build manually. Add when:
- You want to choose a branch, environment, or feature flag at trigger time.
- You want to skip certain stages (e.g., skip E2E on a quick sanity run).

---

### 5. `triggers` — Optional
Automates when the pipeline runs. Add when:

| Trigger | When to Use |
|---|---|
| `cron(...)` | Nightly regression runs, scheduled health checks |
| `pollSCM(...)` | No webhook access — Jenkins polls the repo for changes |
| `githubPush()` | Webhook available — preferred over pollSCM (instant, no polling overhead) |

---

### 6. `tools` — Optional
Installs a specific version of a tool from Jenkins Global Tool Configuration. Add when:
- You manage multiple Node.js / Java / Maven versions across projects.
- You want the version defined in Jenkins, not baked into the agent image.

---

### 7. `stages` — **Required**

#### `when` — run a stage conditionally
```groovy
when { branch 'main' }                        // only on main branch
when { expression { params.SMOKE == true } }  // based on a parameter
when { environment name: 'APP_ENV', value: 'production' }
when { changeRequest() }                       // only on pull requests
```

#### `parallel` — run stages at the same time
Use when stages are independent (cross-browser tests, multi-platform builds). Cuts total time.

#### `input` — wait for human approval
Use before deploying to production or any environment that requires a sign-off.

#### `retry` / `timeout` per stage
```groovy
stage('Flaky API Test') {
    options {
        retry(3)
        timeout(time: 5, unit: 'MINUTES')
    }
    steps { sh 'npm run test:api' }
}
```

---

### 8. `post` — Recommended

| Condition | When to Use |
|---|---|
| `always` | Cleanup, publish reports, archive artifacts — runs regardless of result |
| `success` | Notify team on green build, trigger downstream jobs |
| `failure` | Alert team, create incident ticket, send email |
| `unstable` | Tests passed but some were flaky or marked unstable |
| `changed` | Notify only when the result changes (pass → fail or fail → pass) |
| `cleanup` | Final cleanup that runs after all other `post` conditions |

---

## Quick Decision Guide

```
Starting a new project?
  → Use: agent + options (timeout, timestamps, buildDiscarder) + stages + post (always, failure)

Adding secrets / config?
  → Add: environment block with credentials()

Need scheduled runs?
  → Add: triggers { cron(...) }

Need manual env selection?
  → Add: parameters block

Cross-browser or multi-platform?
  → Use: parallel inside stages

Deploying to production?
  → Add: input step for manual approval gate

Tests producing reports?
  → Add: junit / publishHTML / archiveArtifacts inside post { always }
```
