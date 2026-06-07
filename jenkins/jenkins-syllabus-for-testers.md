# Jenkins Syllabus for Testers

## Module 1: Introduction to CI/CD and Jenkins

### 1.1 What is CI/CD?
- Continuous Integration (CI) concepts
- Continuous Delivery vs Continuous Deployment
- Why CI/CD matters for QA and testing teams
- Role of a tester in a CI/CD pipeline

### 1.2 Introduction to Jenkins
- What is Jenkins and why it is used
- Jenkins architecture (Master/Agent)
- Jenkins vs other CI tools (GitHub Actions, GitLab CI, CircleCI)
- Installing Jenkins locally (WAR file / Docker)
- Jenkins UI walkthrough: Dashboard, Jobs, Build History, Console Output

---

## Module 2: Jenkins Fundamentals

### 2.1 Jenkins Jobs
- Freestyle project
- Pipeline project
- Multi-branch pipeline
- Creating your first freestyle job
- Build triggers: Manual, Poll SCM, Webhook, Schedule (cron syntax)

### 2.2 Source Code Management (SCM) Integration
- Connecting Jenkins to GitHub / GitLab / Bitbucket
- Triggering builds on pull requests and commits
- Branch-based build strategies

### 2.3 Build Configuration
- Adding build steps (execute shell / Windows batch)
- Setting up environment variables
- Archiving artifacts and test reports
- Setting build timeouts and retry logic

---

## Module 3: Running Tests in Jenkins

### 3.1 Running Automated Tests
- Running Selenium / Playwright tests in Jenkins
- Running API tests (Postman / Newman, RestAssured)
- Running unit tests (JUnit, TestNG, NUnit, pytest)
- Passing environment-specific configs (staging, QA, prod)

### 3.2 Test Reporting in Jenkins
- Integrating JUnit XML reports (`junit` post step)
- Publishing HTML reports (HTML Publisher plugin)
- Allure Report integration
- TestNG report integration
- Reading build pass/fail status from test results

### 3.3 Parallel Test Execution
- Running tests in parallel using Jenkins
- Using Jenkins matrix builds
- Splitting test suites for faster feedback

---

## Module 4: Jenkins Pipelines (Declarative)

### 4.1 Pipeline Basics
- What is a Jenkinsfile
- Declarative vs Scripted pipeline
- Pipeline stages: `agent`, `stages`, `stage`, `steps`
- `post` block: always, success, failure, unstable

### 4.2 Writing a Basic Test Pipeline
```groovy
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-repo.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }
        stage('Run Tests') {
            steps {
                sh 'npm test'
            }
        }
        stage('Publish Report') {
            steps {
                publishHTML(target: [
                    reportDir: 'test-results',
                    reportFiles: 'index.html',
                    reportName: 'Test Report'
                ])
            }
        }
    }
    post {
        always {
            junit 'test-results/*.xml'
        }
        failure {
            echo 'Tests failed!'
        }
    }
}
```

### 4.3 Pipeline Features for Testers
- Using `when` conditions (run tests only on specific branches)
- `input` step for manual approval before deployment
- `timeout` and `retry` blocks
- Stashing and unstashing test artifacts between stages
- Environment variables and credentials in pipelines

---

## Module 5: Jenkins Plugins for Testers

### 5.1 Essential Plugins
| Plugin | Purpose |
|--------|---------|
| JUnit Plugin | Parse and display JUnit XML test results |
| HTML Publisher | Publish HTML test reports |
| Allure Jenkins Plugin | Allure test reports |
| Email Extension Plugin | Email notifications on build results |
| Slack Notification Plugin | Slack alerts for build/test status |
| Git Plugin | SCM integration |
| Credentials Plugin | Manage secrets and credentials |
| Blue Ocean | Modern Jenkins UI |
| Parameterized Trigger | Trigger downstream test jobs |
| Docker Plugin | Run tests inside Docker containers |

### 5.2 Installing and Configuring Plugins
- Managing plugins via Jenkins UI
- Plugin dependency management

---

## Module 6: Test Environment Management

### 6.1 Managing Credentials Securely
- Storing API keys, passwords, tokens in Jenkins Credentials
- Using credentials in pipelines with `withCredentials`
- Avoiding hardcoded secrets in Jenkinsfile

### 6.2 Parameterized Builds
- Adding build parameters (string, choice, boolean, file)
- Running tests against different environments using parameters
- Running tests for specific browsers or platforms

### 6.3 Docker in Jenkins (Test Environments)
- Running tests inside Docker containers
- Using Docker agents in declarative pipelines
- Benefits: clean environment per test run

---

## Module 7: Notifications and Reporting

### 7.1 Email Notifications
- Configuring SMTP in Jenkins
- Sending pass/fail emails to the team
- Email templates with test summary

### 7.2 Slack Notifications
- Slack plugin setup
- Sending build and test status to Slack channels
- Custom messages with test counts and links

### 7.3 Build Status Badges
- Adding build status badge to GitHub README
- Test coverage badges

---

## Module 8: Jenkins for API and Performance Testing

### 8.1 API Testing in Jenkins
- Running Newman (Postman CLI) in Jenkins
- Running RestAssured / Karate tests in Jenkins
- Publishing API test results

### 8.2 Performance Testing Integration
- Running JMeter tests in Jenkins
- Jenkins Performance Plugin for JMeter reports
- Setting performance thresholds (fail build if response time exceeds limit)

---

## Module 9: Multi-Branch Pipelines and Pull Request Testing

### 9.1 Multi-Branch Pipeline
- Auto-detecting branches from GitHub/GitLab
- Running tests per branch automatically
- Ignoring specific branches

### 9.2 Pull Request (PR) Testing
- Triggering test pipeline on PR creation/update
- Reporting test status back to GitHub as a check
- Blocking PR merge if tests fail
- Using GitHub webhooks with Jenkins

---

## Module 10: Jenkins Administration Basics (Tester-Relevant)

### 10.1 Managing Nodes/Agents
- What are Jenkins agents?
- Running tests on specific agents (e.g., Windows, Linux, Mac)
- Labeling agents and using them in pipelines

### 10.2 Jenkins Folder and Views
- Organizing jobs with folders
- Creating custom views (e.g., "All Regression Tests")
- Using the Blue Ocean dashboard

### 10.3 Scheduling Test Runs
- Cron expressions in Jenkins (`H 2 * * 1-5` = weekdays at 2 AM)
- Nightly regression builds
- Smoke test on every deployment

### 10.4 Security Basics
- Role-based access control (RBAC)
- Giving testers run/view permissions without admin access

---

## Module 11: Jenkins Best Practices for Testers

- Keep Jenkinsfile in the same repo as test code
- Use declarative pipelines over scripted
- Always publish test results even on failure (`post { always { ... } }`)
- Use Docker containers for consistent test environments
- Separate smoke tests, regression tests, and performance tests into stages
- Set meaningful build names using the `currentBuild.displayName`
- Archive test artifacts for debugging failures
- Use short-lived credentials — never hardcode them
- Run fast tests first (fail fast strategy)
- Tag and categorize tests to run targeted subsets in CI

---

## Module 12: Hands-On Practice Projects

### Project 1 — Basic Selenium Test Pipeline
> Create a Jenkinsfile that checks out a Selenium project, installs dependencies, runs tests, and publishes the HTML report.

### Project 2 — API Test Pipeline with Newman
> Create a pipeline that runs a Postman collection via Newman and emails the results.

### Project 3 — Multi-Branch Test Pipeline
> Set up a multi-branch pipeline on GitHub that runs smoke tests on every PR and full regression on the main branch.

### Project 4 — Nightly Regression Build
> Schedule a nightly regression run using cron, publish an Allure report, and notify the team on Slack.

### Project 5 — Parameterized Cross-Browser Test Run
> Create a parameterized job to run Playwright/Selenium tests on Chrome, Firefox, or Safari based on a choice parameter.

---

## Tools & Technologies Covered

- Jenkins (Freestyle + Pipeline)
- Git / GitHub / GitLab
- Selenium, Playwright, TestNG, JUnit
- Newman (Postman CLI)
- JMeter (Performance)
- Allure Reports
- Docker (basic)
- Groovy (basic — for Jenkinsfile)
- Slack, Email (notifications)
