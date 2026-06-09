# Git Daily Workflow — Automation Tester

A real day-by-day guide to how an automation tester works with Git on a team project.

---

## The Big Picture

As an automation tester, you work on:
- Writing new test scripts
- Fixing failing tests
- Updating tests after a feature change
- Reviewing test PRs from others

Git keeps all of this organized, trackable, and safe across your team.

---

## Start of Day — Sync Your Local Branch

Before writing a single line of code, always pull the latest changes.

```bash
# Make sure you are on main
git checkout main

# Pull latest changes from the remote
git pull origin main

git log --oneline -5
# Read what changed since yesterday
```

> Why: If you start working on stale code, you will get merge conflicts later. Syncing first saves time.

---

## Creating a Branch for Your Work

Never commit directly to `main`. Always create a branch for your task.

```bash
# Create a branch named after the task/ticket
git checkout -b feature/TC-101-login-test

# Branch naming convention:
# feature/<ticket-id>-<short-description>  → new test
# fix/<ticket-id>-<short-description>      → fixing a broken test
# chore/<description>                      → config, cleanup, updates
# test/<ticket-id>-<description>           → test-only changes
```

**Examples:**
```
feature/TC-101-login-smoke-test
fix/TC-203-checkout-locator-fix
chore/update-selenium-version
test/TC-315-payment-edge-cases
```

> Why: Branches isolate your work. If something goes wrong, main is always safe.

---

## During the Day — Stage and Commit Often

Do not write 500 lines and then commit once. Commit in small logical steps.

```bash
# Check what you have changed
git status
git diff

# Stage specific files (preferred over git add .)
git add tests/login/LoginTest.cs
git add pages/LoginPage.cs

# Or stage everything if all changes belong to this commit
git add .

# Commit with a meaningful message
git commit -m "feat(login): add TC-101 login smoke test with valid credentials"
```

---

## Standard Commit Message Format

Follow the **Conventional Commits** standard. It makes history readable and helps with release notes.

### Structure
```
<type>(<scope>): <short description>

[optional body — explain WHY, not WHAT]
[optional footer — e.g., Closes TC-101]
```

### Types

| Type | When to Use |
|------|-------------|
| `feat` | Adding a new test or new feature |
| `fix` | Fixing a broken test or bug |
| `refactor` | Rewriting code without changing behavior |
| `chore` | Config changes, dependency updates, setup |
| `docs` | Updating README, comments, notes |
| `test` | Adding missing tests or correcting test data |
| `ci` | Changes to CI/CD pipeline files |
| `revert` | Reverting a previous commit |

### Real Examples (QA Context)

```bash
# New test
git commit -m "feat(login): add TC-101 smoke test for valid login"

# Fixing a broken test
git commit -m "fix(checkout): update product locator after UI change in sprint 12"

# Updating framework config
git commit -m "chore: upgrade Selenium from 4.8 to 4.18"

# Updating a page object
git commit -m "refactor(LoginPage): rename method clickLogin to submitLoginForm"

# Removing a flaky test temporarily
git commit -m "test(payment): skip TC-305 flaky test pending investigation"

# Adding test data
git commit -m "test(data): add edge case test data for empty cart scenarios"

# CI pipeline fix
git commit -m "ci: fix Jenkins pipeline to run regression on main only"

# Multi-line with body
git commit -m "fix(api): increase timeout for slow payment API

The payment gateway averages 8s response time in staging.
Default 5s timeout was causing intermittent failures.

Closes TC-422"
```

### Rules for Good Commit Messages

- Use present tense: `add test` not `added test`
- Keep the first line under 72 characters
- Explain WHY in the body if the reason is not obvious
- Reference the ticket ID in the body or footer
- Never write: `fix`, `test`, `update`, `changes` — these mean nothing

---

## Keeping Your Branch Up to Date with Main

After a few days, main will have new commits from your team. Update your branch.

```bash
# Option 1: Rebase (cleaner — recommended for feature branches)
git checkout feature/TC-101-login-test
git fetch origin
git rebase origin/main

# Option 2: Merge (shows a merge commit in history)
git merge main
```

**Rebase is preferred** for feature branches because it gives a clean linear history. Your commits appear as if they were always written on top of the latest main.

If there are conflicts during rebase:
```bash
# Git pauses on the conflicting commit
# Fix the conflict in the file manually
git add <conflicted-file>
git rebase --continue

# If it gets messy, abort and start fresh
git rebase --abort
```

---

## Before Raising a PR — Self-Review Checklist

```bash
# 1. Check all your commits
git log main..feature/TC-101-login-test --oneline

# 2. Review the full diff
git diff main..feature/TC-101-login-test

# 3. Check for leftover debug logs, skipped tests, commented code
git diff main..feature/TC-101-login-test | grep -i "console.log\|Thread.Sleep\|skip\|todo"

# 4. Push your branch
git push -u origin feature/TC-101-login-test
```

> Never push directly to main. Always raise a PR and get at least one review.

---

## Raising a PR

```bash
# Using GitHub CLI (recommended)
gh pr create \
  --title "feat(login): TC-101 login smoke test" \
  --body "## What
Added login smoke test for valid credentials.

## Test Coverage
- TC-101: valid login
- TC-102: empty username
- TC-103: wrong password

## How to Test
Run: dotnet test --filter Category=Login

Closes #TC-101"
```

---

## Handling Review Feedback

After a reviewer comments, make changes on the same branch and push again.

```bash
# Make the changes
git add tests/login/LoginTest.cs
git commit -m "refactor(login): extract wait logic into helper method per review"

git push origin feature/TC-101-login-test
# PR auto-updates — no need to create a new PR
```

> Do NOT squash or force push during review unless the reviewer asks. It makes the reviewer lose their comment context.

---

## After PR is Merged — Clean Up

```bash
# Switch back to main and pull the merged changes
git checkout main
git pull origin main

# Delete your local branch
git branch -d feature/TC-101-login-test

# Delete the remote branch (if GitHub did not auto-delete)
git push origin --delete feature/TC-101-login-test
```

---

## End of Day — Check Your State

Before closing your laptop:

```bash
git status
# Do you have uncommitted changes?

git stash push -m "wip: TC-204 half-written boundary test"
# Stash if you cannot commit yet

git log --oneline -3
# Confirm your commits are in good shape

git push origin feature/TC-101-login-test
# Always push your work to remote before end of day
# Your local machine can crash — remote is the backup
```

---

## Full Day Workflow — Cheat Sheet

```bash
# Morning
git checkout main
git pull origin main
git checkout -b feature/TC-101-login-test

# During the day
git status
git diff
git add <files>
git commit -m "feat(login): add valid login test scenario"

# Keep branch updated
git fetch origin
git rebase origin/main

# End of day
git push origin feature/TC-101-login-test

# PR raised — handling review
git add <files>
git commit -m "refactor(login): address review comments"
git push origin feature/TC-101-login-test

# After merge
git checkout main
git pull origin main
git branch -d feature/TC-101-login-test
```

---

## Branching Strategy Overview

Most teams follow one of these:

### GitHub Flow (simple — used by most agile QA teams)
```
main ← always deployable
  └── feature/TC-101-login-test  → raise PR → merge to main
  └── fix/TC-203-broken-locator  → raise PR → merge to main
```

### GitFlow (structured — used in release-based projects)
```
main       ← production releases only
develop    ← integration branch
  └── feature/TC-101  → merge to develop
  └── release/1.5     → from develop, hotfix → merge to main and develop
  └── hotfix/timeout  → from main → merge to main and develop
```

> For most automation testing work, **GitHub Flow is enough**. Use GitFlow only if your project has scheduled release cycles.

---

## Common Mistakes Automation Testers Make with Git

| Mistake | What Happens | Better Approach |
|---------|-------------|-----------------|
| Committing directly to main | Breaks everyone's work | Always use a feature branch |
| `git add .` with debug logs | Commits garbage | Use `git diff` before staging |
| Vague commit messages like `fix` | Unreadable history | Use Conventional Commits |
| Not pulling before starting work | Gets merge conflicts later | `git pull` every morning |
| Force pushing to main | Destroys team history | Never force push shared branches |
| Not pushing before end of day | Loses work if machine crashes | Push daily at minimum |
| Committing test credentials or `.env` | Security risk | Add `.gitignore` early |
| Giant commits with 50 files | Hard to review and revert | Small, focused commits |
