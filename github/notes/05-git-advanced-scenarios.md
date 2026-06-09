# Git Advanced Scenarios

These scenarios cover situations you will face on real automation projects — team conflicts, broken pipelines, history cleanup, and branch strategies.

---

## Scenario 1 — Interactive Rebase: Clean Up Messy Commits Before PR

**Situation:** You made 6 commits while developing a feature. Many are "wip" or "fix typo" commits. You want to squash them into 2 clean commits before raising a PR.

```bash
git log --oneline
# f1a2b3c wip: half done
# d4e5f6a fix typo in locator
# 7g8h9i0 fix another typo
# j1k2l3m feat: add login test
# n4o5p6q wip: started logout test
# r7s8t9u feat: add logout test
```

Start interactive rebase for last 6 commits:
```bash
git rebase -i HEAD~6
```

Editor opens — change `pick` to `squash` (or `s`) to combine commits:
```
pick  j1k2l3m feat: add login test
squash f1a2b3c wip: half done
squash d4e5f6a fix typo in locator
squash 7g8h9i0 fix another typo
pick  r7s8t9u feat: add logout test
squash n4o5p6q wip: started logout test
```

After saving, Git opens another editor to write the final commit message:
```
feat: add login and logout test scenarios
```

Result:
```bash
git log --oneline
# a1b2c3d feat: add login and logout test scenarios  ← clean single commit
```

**Why this matters:** A clean PR history is easier to review and easier to revert if something breaks.

---

## Scenario 2 — Bisect: Find Which Commit Broke the Build

**Situation:** CI was green 2 days ago. Now 3 tests are failing. There are 40 commits between then and now. Find the bad commit without reading all 40.

```bash
git bisect start

git bisect bad
# Marks current commit (HEAD) as broken

git bisect good a3f8d21
# Marks a known-good commit from 2 days ago

# Git automatically checks out the middle commit
# Run your tests
npm test

# If tests pass on this commit:
git bisect good

# If tests fail on this commit:
git bisect bad

# Repeat until Git says:
# "abc1234 is the first bad commit"

git bisect reset
# Returns you to HEAD after bisect is done
```

**Why this matters:** Binary search finds the bad commit in ~6 steps instead of reading 40 commits manually.

---

## Scenario 3 — Reflog: Recover a Lost Commit

**Situation:** You ran `git reset --hard` and lost a commit you needed. Or you deleted a branch by mistake.

```bash
git reflog
# Shows every HEAD movement — even reset and deleted branches
# Example output:
# abc1234 HEAD@{0}: reset: moving to HEAD~2
# def5678 HEAD@{1}: commit: feat: add payment test   ← this is the lost commit
# ghi9012 HEAD@{2}: commit: feat: add checkout test

# Recover the lost commit
git checkout def5678
# Or restore it to a new branch
git checkout -b recovery/payment-test def5678
```

**Why this matters:** Reflog is Git's safety net. Nothing is truly lost for about 30 days unless you explicitly run garbage collection.

---

## Scenario 4 — Force Push Safely After Rebase

**Situation:** You rebased your feature branch and need to push, but the remote has the old history.

```bash
git rebase main
# Your branch history is now rewritten

git push origin feature/login-tests
# REJECTED — remote has different history

# Safe option — only pushes if nobody else pushed on top
git push --force-with-lease origin feature/login-tests
```

> Never force push to `main` or `master`. Only force push your own feature branches.

**Why `--force-with-lease` and not `--force`:**
- `--force` pushes no matter what — it overwrites anyone else's work
- `--force-with-lease` checks that the remote matches what you last fetched — safer

---

## Scenario 5 — Submodule: Link Another Repo as a Dependency

**Situation:** Your automation framework is a separate shared repo. You want to include it inside your test project.

```bash
# Add the shared framework as a submodule
git submodule add https://github.com/your-org/test-framework.git framework

git status
# Shows: new file .gitmodules, new file framework/

git commit -m "chore: add test-framework as submodule"
git push
```

When a teammate clones your repo:
```bash
git clone --recurse-submodules https://github.com/your-org/my-tests.git
# Clones the main repo and pulls the submodule too

# Or if already cloned without submodules:
git submodule update --init --recursive
```

**Why this matters:** Submodules keep shared code versioned and separate, so your tests always reference a known version of the framework.

---

## Scenario 6 — Worktree: Work on Two Branches at the Same Time

**Situation:** You are fixing a critical bug on `hotfix/timeout` but also need to continue your feature work without switching branches constantly.

```bash
# Add a second working directory linked to a different branch
git worktree add ../hotfix-workspace hotfix/timeout

# Now you have two folders:
# my-project/          → your feature branch
# hotfix-workspace/    → hotfix/timeout branch

# Work on the hotfix in the new folder
cd ../hotfix-workspace
# fix the bug, commit, push

# Back to your feature without anything changing
cd ../my-project
# Still on your feature branch, nothing interrupted
```

**Why this matters:** No stashing, no branch switching. Two branches open simultaneously.

---

## Scenario 7 — Squash Merge: Keep Main History Clean

**Situation:** A feature branch has 12 commits — useful during dev, but you want only 1 commit on main.

```bash
git checkout main
git merge --squash feature/payment-tests
# All 12 commits are squashed into staged changes

git commit -m "feat: add complete payment flow test suite"
# One clean commit on main

git branch -d feature/payment-tests
```

**Difference from regular merge:**
| Strategy | What main sees |
|----------|---------------|
| `git merge` | All individual commits from the branch |
| `git merge --squash` | One combined commit |
| `git rebase` + merge | Linear history, individual commits visible |

---

## Scenario 8 — Git Hooks: Run Tests Before Every Commit

**Situation:** You want to prevent commits if tests fail, so broken code never enters the repo.

```bash
# Navigate to hooks folder in your .git directory
cd .git/hooks

# Create a pre-commit hook
nano pre-commit
```

Add this content:
```bash
#!/bin/sh
echo "Running tests before commit..."
npm test

if [ $? -ne 0 ]; then
  echo "Tests failed. Commit blocked."
  exit 1
fi
```

```bash
chmod +x pre-commit
# Now every git commit runs tests first
# If tests fail → commit is blocked
```

**Why this matters:** Pre-commit hooks are a first line of defense before CI/CD even runs.

---

## Scenario 9 — Patch File: Share a Change Without Pushing

**Situation:** You need to share a fix with a colleague who does not have access to your branch.

```bash
# Create a patch from your last commit
git format-patch HEAD~1

# Creates: 0001-fix-add-timeout-to-api-call.patch

# Your colleague applies it
git apply 0001-fix-add-timeout-to-api-call.patch
```

Or create a patch between two branches:
```bash
git diff main..feature/login-tests > login-feature.patch
git apply login-feature.patch
```

**Why this matters:** Useful when working across restricted networks, forks, or offline environments.

---

## Scenario 10 — Signing Commits with GPG

**Situation:** Your org requires verified commits on the main branch. Unsigned commits are rejected.

```bash
# Generate a GPG key (if not done already)
gpg --full-generate-key

# Get your key ID
gpg --list-secret-keys --keyid-format LONG

# Configure Git to use it
git config --global user.signingkey YOUR_KEY_ID
git config --global commit.gpgsign true

# Now every commit is signed automatically
git commit -m "feat: add verified test"

# Verify a commit is signed
git log --show-signature -1
```

**Why this matters:** Signed commits prove the commit actually came from you — important in regulated environments.

---

## Scenario 11 — Sparse Checkout: Pull Only Part of a Large Repo

**Situation:** A monorepo has 50 projects. You only work on the `qa-tests/` folder. Cloning everything is slow.

```bash
git clone --no-checkout https://github.com/org/monorepo.git
cd monorepo

git sparse-checkout init --cone
git sparse-checkout set qa-tests/

git checkout main
# Only qa-tests/ folder is downloaded
```

**Why this matters:** Saves bandwidth and time on large repos. Common in enterprise monorepos.

---

## Scenario 12 — Git Blame with Range: Why Was This Line Changed?

**Situation:** A locator in your test broke. You want to know why that specific line was changed.

```bash
# See full history of a specific file
git log --follow -p tests/login_test.py

# Find the commit that last changed line 42
git blame -L 42,42 tests/login_test.py
# Output: a1b2c3d4 (Kundalik 2024-05-10 42) driver.find_element(By.ID, "user")

# See the full commit
git show a1b2c3d4
# See the PR that introduced it, the reasoning — full context
```

**Why this matters:** Understanding WHY a line changed is more valuable than just seeing what changed.

---

## Quick Reference — Advanced Commands

| Command | Purpose |
|---------|---------|
| `git rebase -i HEAD~N` | Interactively rewrite last N commits |
| `git bisect start/good/bad` | Binary search for a bad commit |
| `git reflog` | View all HEAD movements, recover lost commits |
| `git push --force-with-lease` | Safe force push after rebase |
| `git submodule add <url>` | Link another repo inside this one |
| `git worktree add <path> <branch>` | Open a second branch in a separate folder |
| `git merge --squash <branch>` | Combine all branch commits into one |
| `git format-patch HEAD~1` | Export last commit as a patch file |
| `git sparse-checkout set <folder>` | Checkout only part of a large repo |
| `git blame -L <line>,<line> <file>` | Find who changed a specific line |
