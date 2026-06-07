# Jenkins Topics to Learn

## Basics
- What is Jenkins and CI/CD
- Jenkins installation (local / Docker)
- Jenkins dashboard and UI overview
- Creating and running a freestyle job
- Build triggers (manual, cron, webhook, SCM poll)
- Console output and build history

## Source Code Integration
- Connecting Jenkins to GitHub / GitLab
- Triggering builds on push and pull requests
- Branch-based builds

## Jobs and Configuration
- Freestyle vs Pipeline jobs
- Build parameters (string, choice, boolean)
- Environment variables
- Archiving artifacts
- Build timeouts and retry

## Pipelines (Jenkinsfile)
- Declarative pipeline syntax
- `agent`, `stages`, `stage`, `steps`
- `post` block (always, success, failure)
- `when` conditions
- `timeout` and `retry`
- `input` step (manual approval)
- Environment variables and credentials in pipelines
- Stash and unstash

## Running Tests
- Running Selenium / Playwright tests
- Running API tests (Newman / RestAssured)
- Running unit tests (JUnit / TestNG / pytest)
- Passing configs per environment (QA, staging, prod)
- Parallel test execution

## Test Reporting
- JUnit XML report integration
- HTML Publisher plugin
- Allure Report integration
- Reading pass/fail from test results

## Plugins
- JUnit Plugin
- HTML Publisher
- Allure Jenkins Plugin
- Email Extension Plugin
- Slack Notification Plugin
- Blue Ocean
- Docker Plugin
- Credentials Plugin

## Notifications
- Email notifications on build results
- Slack alerts for build/test status

## Docker in Jenkins
- Running tests inside Docker containers
- Docker agent in declarative pipeline

## Multi-Branch and PR Testing
- Multi-branch pipeline setup
- Auto-detecting branches from GitHub
- PR-triggered test runs
- Reporting test status back to GitHub

## Scheduling
- Cron expressions in Jenkins
- Nightly regression builds
- Smoke tests on every deployment

## Security and Administration
- Storing secrets in Jenkins Credentials
- `withCredentials` in pipelines
- Role-based access control (RBAC)
- Managing nodes and agents
- Labeling agents for specific OS

## Best Practices
- Fail fast strategy (run smoke tests first)
- Always publish reports even on failure
- Keep Jenkinsfile in the test repo
- Never hardcode credentials
- Use Docker for clean test environments
