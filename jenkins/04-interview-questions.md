# Jenkins Interview Questions

## Basic / Beginner

**1. What is Jenkins?**
Jenkins is an open-source automation server used to automate building, testing, and deploying software. It supports CI/CD pipelines and has a large plugin ecosystem.

**2. What is CI/CD?**
- **CI (Continuous Integration):** Automatically build and test code on every commit.
- **CD (Continuous Delivery/Deployment):** Automatically deliver tested code to staging or production.

**3. What is a Jenkins Pipeline?**
A Pipeline is a suite of plugins that supports implementing and integrating continuous delivery pipelines. Defined using a `Jenkinsfile` (written in Groovy DSL).

**4. What are the two types of Jenkins Pipeline syntax?**
- **Declarative Pipeline** — structured, easier to read, starts with `pipeline {}`
- **Scripted Pipeline** — more flexible, uses Groovy, starts with `node {}`

**5. What is a Jenkinsfile?**
A text file stored in the root of the repository that defines the pipeline. It allows pipeline-as-code and version control of CI/CD configuration.

**6. What is a Jenkins Agent/Node?**
An agent is a machine (physical, VM, or container) that executes the pipeline steps. The Jenkins master schedules jobs; agents run them.

**7. What is the difference between a Freestyle job and a Pipeline job?**
- **Freestyle:** Simple UI-based job configuration, limited flexibility.
- **Pipeline:** Code-based (`Jenkinsfile`), supports complex workflows, parallel stages, and version control.

**8. What are Jenkins Plugins?**
Plugins extend Jenkins functionality — e.g., Git plugin for SCM integration, NodeJS plugin for runtime management, HTML Publisher for reports.

---

## Intermediate

**9. What are Jenkins Stages and Steps?**
- **Stage:** A logical phase of the pipeline (Build, Test, Deploy).
- **Step:** An individual task inside a stage (e.g., `sh 'npm test'`).

**10. What is the `post` block in a Declarative Pipeline?**
Defines actions that run after the pipeline or stage completes.
```groovy
post {
    always  { /* runs every time */ }
    success { /* runs on success */ }
    failure { /* runs on failure */ }
}
```

**11. How do you trigger a Jenkins pipeline automatically?**
- **Poll SCM** — Jenkins checks the repo at a set interval.
- **Webhook** — GitHub/GitLab pushes a notification to Jenkins on commit.
- **Build Triggers** — scheduled (cron), upstream job completion, or manual.

**12. What is a Jenkins Multibranch Pipeline?**
Automatically creates a pipeline job for each branch in a repository. Each branch can have its own `Jenkinsfile`. Useful for feature branch workflows.

**13. How do you pass parameters to a Jenkins job?**
```groovy
parameters {
    string(name: 'ENV', defaultValue: 'staging', description: 'Target environment')
    booleanParam(name: 'RUN_SMOKE', defaultValue: true, description: 'Run smoke tests?')
}
```
Access via `params.ENV` inside the pipeline.

**14. What are Jenkins Credentials and how are they used?**
Credentials (API keys, passwords, tokens) are stored securely in Jenkins and accessed in pipelines:
```groovy
withCredentials([string(credentialsId: 'MY_TOKEN', variable: 'TOKEN')]) {
    sh 'curl -H "Authorization: Bearer $TOKEN" ...'
}
```

**15. How do you run parallel stages in Jenkins?**
```groovy
parallel {
    stage('Chrome Tests') { steps { sh 'npx playwright test --project=chromium' } }
    stage('Firefox Tests') { steps { sh 'npx playwright test --project=firefox' } }
}
```

**16. What is a Jenkins Shared Library?**
Reusable Groovy code stored in a separate repository, loaded into pipelines to avoid duplication. Defined using `@Library('my-shared-lib')`.

**17. What is the difference between `sh` and `bat` in Jenkins?**
- `sh` — runs shell commands on Linux/Mac agents.
- `bat` — runs batch commands on Windows agents.

---

## Advanced

**18. How do you archive artifacts in Jenkins?**
```groovy
archiveArtifacts artifacts: 'test-results/**/*', fingerprint: true
```
Stores files (reports, binaries) that can be downloaded from the Jenkins build page.

**19. What is the Jenkins Master-Agent architecture?**
- **Master (Controller):** Manages jobs, scheduling, UI, configuration.
- **Agent:** Executes the actual build/test steps. Agents connect via SSH, JNLP, or Docker.

**20. How do you handle environment variables in Jenkins?**
```groovy
environment {
    APP_ENV = 'production'
    DB_URL  = credentials('db-url-credential')
}
```
Jenkins also provides built-in vars like `BUILD_NUMBER`, `WORKSPACE`, `JOB_NAME`.

**21. What is Blue Ocean in Jenkins?**
A modern UI plugin for Jenkins that provides a visual representation of pipelines, making it easier to visualize stages, steps, and test results.

**22. How do you retry a failed step in Jenkins?**
```groovy
retry(3) {
    sh 'flaky-command'
}
```

**23. How do you set a build timeout in Jenkins?**
```groovy
options {
    timeout(time: 30, unit: 'MINUTES')
}
```

**24. What is `stash` and `unstash` in Jenkins?**
Used to pass files between stages running on different agents:
```groovy
stash name: 'build-output', includes: 'dist/**'
unstash 'build-output'
```

**25. How would you integrate Playwright test results in Jenkins?**
- Run tests with JUnit reporter: `npx playwright test --reporter=junit`
- Publish results using the JUnit plugin:
```groovy
junit 'test-results/results.xml'
```
- Publish HTML report using the HTML Publisher plugin:
```groovy
publishHTML(target: [reportDir: 'playwright-report', reportFiles: 'index.html', reportName: 'Playwright Report'])
```

---

## Scenario-Based

**26. Your pipeline is passing locally but failing in Jenkins — what do you check?**
- Node.js / browser versions differ between local and Jenkins agent.
- Missing environment variables or credentials on the Jenkins agent.
- File path differences (Windows vs Linux agents).
- Playwright browsers not installed on the agent (`npx playwright install --with-deps`).

**27. How do you ensure only one build runs at a time for a job?**
```groovy
options {
    disableConcurrentBuilds()
}
```

**28. How do you send notifications (email/Slack) on build failure?**
```groovy
post {
    failure {
        mail to: 'team@example.com', subject: "Build Failed: ${env.JOB_NAME}", body: "Check ${env.BUILD_URL}"
        slackSend channel: '#ci', message: "Build failed: ${env.BUILD_URL}"
    }
}
```

**29. What is the difference between `input` step and `approval` in Jenkins?**
The `input` step pauses the pipeline and waits for a human to approve before continuing — used in deployment gates:
```groovy
input message: 'Deploy to production?', ok: 'Yes, deploy'
```

**30. How do you clean the workspace before a build?**
```groovy
options {
    cleanWs()
}
// or inside a stage:
steps {
    cleanWs()
}
```
