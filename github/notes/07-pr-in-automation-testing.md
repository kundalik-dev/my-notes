# Pull Requests in Automation Testing

## What is a PR?

A Pull Request (PR) is a request to merge your branch into a shared branch (usually `main` or `develop`). It is the checkpoint between your local work and the team's codebase.

For automation testers, every new test, bug fix, or framework change should go through a PR — not pushed directly to main.

---

## Why PRs Matter for QA Automation

| Without PR | With PR |
|------------|---------|
| Broken tests land directly in main | Code is reviewed before merge |
| No record of why a test was added | PR description explains the context |
| Hard to track what changed and when | Full diff visible to the team |
| CI might not run | CI runs on every PR automatically |
| No approval gate | At least one reviewer approves |

---

## When to Raise a PR as an Automation Tester

- After writing new test cases for a feature
- After fixing a failing or flaky test
- After updating a page object or helper due to UI change
- After adding or updating test data files
- After changing framework configuration or dependencies
- After updating CI/CD pipeline files (Jenkinsfile, yml)

---

## Anatomy of a Good PR (Automation Testing)

### 1. Branch Name
Should be clear and ticket-linked:
```
feature/TC-101-login-smoke-test
fix/TC-203-checkout-locator-broken
chore/upgrade-selenium-4.18
refactor/login-page-object-cleanup
```

### 2. PR Title
Short, clear, follows Conventional Commits format:
```
feat(login): add TC-101 smoke test for valid login flow
fix(checkout): update product card locator after sprint 12 UI change
chore: upgrade Selenium WebDriver from 4.8 to 4.18
```

### 3. PR Description Template

Use this structure every time:

```markdown
## What Changed
- Added smoke test for login with valid credentials (TC-101)
- Added negative test for empty username and password (TC-102)
- Updated LoginPage.cs with new submitLoginForm() method

## Why
Sprint 12 added a new login page. Existing tests needed to be updated
and new scenarios added as per test plan TC-101 to TC-105.

## Test Coverage
- [x] TC-101: Valid login — passes
- [x] TC-102: Empty username — passes
- [x] TC-103: Wrong password — passes
- [ ] TC-104: Account locked — pending (out of scope for this PR)

## How to Run
```bash
dotnet test --filter Category=Login
```

## Notes for Reviewer
- LoginPage.cs has a new wait strategy — please check if it fits our standard
- TC-104 will be covered in a follow-up PR

Closes #TC-101, #TC-102, #TC-103
```

---

## Before You Raise the PR — Self-Checklist

Go through this before clicking "Create PR":

### Code Quality
- [ ] No `Thread.Sleep` or hardcoded waits
- [ ] Used explicit waits (WebDriverWait / Playwright auto-wait)
- [ ] No hardcoded test data — use data files or constants
- [ ] No debug logs, `Console.WriteLine`, or commented-out code left behind
- [ ] Page objects are used — no raw locators in test methods
- [ ] Test methods are independent — one test does not depend on another
- [ ] Test names clearly describe what they test

### Git Hygiene
- [ ] Branch is up to date with main (`git rebase origin/main`)
- [ ] Commit messages follow Conventional Commits
- [ ] No unrelated changes in this PR
- [ ] No sensitive data — credentials, API keys, `.env` files
- [ ] `.gitignore` is correct — test reports, logs, binaries not committed

### Test Coverage
- [ ] New feature → at least one positive and one negative test
- [ ] Bug fix → test that would have caught the bug is added
- [ ] Page object change → all tests using that page object still pass
- [ ] Existing tests not broken by your changes

### CI
- [ ] Build passes locally before pushing
- [ ] CI pipeline passes on your branch (check GitHub Actions / Jenkins)

---

## PR Size — Keep It Small

### Why PR size matters

| Large PR (500+ lines) | Small PR (< 200 lines) |
|----------------------|----------------------|
| Hard to review properly | Easy to review in 15 minutes |
| Reviewer misses bugs | Reviewer can focus |
| More merge conflicts | Fewer conflicts |
| Risky to merge — many changes at once | Easy to revert if something breaks |

### How to keep PRs small as a tester

- One PR per ticket or feature area
- Do not mix framework changes with test additions in the same PR
- If a feature has 20 test cases, split them into 2–3 PRs by flow (login, checkout, payment)
- Separate refactoring PRs from new test PRs

---

## Types of PRs in Automation Testing

### Feature Test PR
New tests for a new or existing feature.
```
feat(payment): add TC-310 to TC-315 payment flow tests
```
Includes: test files, page object updates, test data

### Bug Fix PR
A test was failing because of a broken locator, wrong assertion, or env issue.
```
fix(cart): update add-to-cart button locator after UI redesign
```
Includes: the fix + a comment explaining what broke and why

### Flaky Test PR
A test was sometimes passing, sometimes failing (timing, data, env issues).
```
fix(search): stabilize TC-205 by replacing implicit wait with explicit wait
```
Includes: the fix + explanation of why it was flaky

### Framework / Infra PR
Changes to the test framework itself — not to specific tests.
```
chore: add retry logic for failed tests in base test class
```
Includes: framework change, any test updates needed, documentation

### Skip / Quarantine PR
Temporarily disabling a broken test that cannot be fixed immediately.
```
test(payment): quarantine TC-305 pending payment gateway fix
```
Always include: a comment with the reason and a Jira/ticket reference.
```csharp
[Ignore("Quarantined: payment gateway returns 503 in staging. Ticket: TC-305")]
```

---

## Linking PRs to Tickets

Always reference your ticket in the PR. GitHub recognizes these keywords and closes the ticket automatically when the PR is merged:

```
Closes #123
Fixes #456
Resolves TC-101
```

In GitHub PR description:
```markdown
Closes #TC-101
Closes #TC-102
```

---

## Draft PRs — When to Use Them

Raise a **Draft PR** when:
- Your work is in progress but you want early feedback
- You want CI to run but the code is not ready for full review
- You are pairing with someone and want them to see your approach

```bash
gh pr create --draft --title "feat(login): WIP login tests" --body "Work in progress — feedback welcome on page object structure"
```

Mark it **Ready for Review** when done:
```bash
gh pr ready
```

---

## After PR is Merged

```bash
# Pull latest main
git checkout main
git pull origin main

# Delete local branch
git branch -d feature/TC-101-login-test

# Delete remote branch if not auto-deleted
git push origin --delete feature/TC-101-login-test

# Verify CI is still green on main
# Check the merged commit in git log
git log --oneline -3
```

---

## Common PR Mistakes by Automation Testers

| Mistake | Problem | Fix |
|---------|---------|-----|
| PR with 800 lines of changes | Nobody reviews it properly | Split into smaller PRs |
| No description | Reviewer has no context | Always fill the description template |
| Committed test reports or logs | Clutters repo | Fix `.gitignore` before adding files |
| `Thread.Sleep(3000)` in tests | Flaky and slow tests | Use explicit waits |
| No CI run before PR | Reviewer finds basic failures | Always check CI before requesting review |
| Mixing test + framework changes | Hard to review and revert | Separate PRs |
| No ticket reference | Cannot trace why test was added | Add `Closes #TC-XXX` in every PR |
| Force pushing during review | Reviewer loses comment context | Only push new commits during review |

---

## Quick Reference

```bash
# Create a PR
gh pr create --title "feat(login): TC-101 login smoke test" --body "..."

# Create a draft PR
gh pr create --draft --title "WIP: TC-101 login test"

# Mark draft as ready
gh pr ready

# Check PR status
gh pr status

# View PR diff
gh pr diff

# Check CI status
gh pr checks

# Merge PR (after approval)
gh pr merge --squash
```
