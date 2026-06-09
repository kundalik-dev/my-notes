# Git Practice Exercises — Beginner & Medium

These are hands-on scenarios to help you understand how Git works by doing, not just reading.
Each exercise tells you the situation, what to do, and explains what happens internally.

---

## Beginner Exercises

---

### Exercise 1 — Create a Repo and Make Your First Commit

**Scenario:** You just started working on a new automation project. Set it up in Git.

**Steps:**
```bash
mkdir my-automation-project
cd my-automation-project
git init
```
> Git creates a hidden `.git` folder. This is where Git stores everything — your history, branches, config.

```bash
# Create a file
echo "# My Automation Project" > README.md

git status
# You will see README.md as an untracked file

git add README.md
git status
# Now README.md is in the staging area (green)

git commit -m "feat: add README for automation project"
git log --oneline
# You will see your first commit with a hash
```

**What you learned:** Files go through 3 states — Untracked → Staged → Committed.

---

### Exercise 2 — Modify a File and See the Diff

**Scenario:** You edited a test file. Check what changed before committing.

```bash
echo "## Test Cases" >> README.md

git status
# README.md shows as modified (red)

git diff
# Shows exactly which lines changed (- removed, + added)

git add README.md
git diff
# Nothing shown — diff only works on unstaged changes

git diff --staged
# Now shows the staged change

git commit -m "docs: add test cases section to README"
```

**What you learned:** `git diff` shows unstaged changes. `git diff --staged` shows what is about to be committed.

---

### Exercise 3 — Undo a Change Before Committing

**Scenario:** You edited a file by mistake and want to throw away that change.

```bash
echo "bad text here" >> README.md
git status
# README.md is modified

git restore README.md
# The change is gone — file is back to last committed state

git status
# Clean working tree
```

**What you learned:** `git restore <file>` throws away unstaged changes. This cannot be undone — the change is gone.

---

### Exercise 4 — Unstage a File

**Scenario:** You staged a file but realized it should not be in this commit.

```bash
touch test-config.json
git add test-config.json
git status
# test-config.json is staged

git restore --staged test-config.json
git status
# test-config.json is now untracked again — not in the commit
```

**What you learned:** `git restore --staged` removes a file from staging but keeps it in your working directory.

---

### Exercise 5 — Create and Switch Between Branches

**Scenario:** You need to work on a new feature without breaking the main code.

```bash
git branch
# Shows: * main (you are on main)

git checkout -b feature/login-tests
# Creates and switches to new branch

git branch
# Shows: main and * feature/login-tests

# Make a change on the new branch
echo "login test file" > login_test.py
git add login_test.py
git commit -m "feat: add login test file"

git checkout main
# Switch back to main

ls
# login_test.py is NOT here — it only exists on feature/login-tests
```

**What you learned:** Branches are isolated. Changes on one branch do not affect other branches until you merge.

---

### Exercise 6 — Merge a Feature Branch into Main

**Scenario:** Your feature is done. Bring it into main.

```bash
git checkout main

git merge feature/login-tests
# Git combines the feature branch into main

git log --oneline
# You can see the commit from feature/login-tests is now in main

git branch -d feature/login-tests
# Clean up the branch after merging
```

**What you learned:** `git merge` brings commits from one branch into another. Delete the branch after merging to keep things clean.

---

### Exercise 7 — Undo the Last Commit (Keep Changes)

**Scenario:** You committed too early. You want to undo the commit but keep your file changes.

```bash
git log --oneline
# See: abc1234 feat: add login page test

git reset --soft HEAD~1
# Commit is removed, but files are still staged

git status
# Files are back in staging area, ready to recommit

git log --oneline
# The commit is gone
```

**What you learned:** `--soft` undoes the commit but keeps your work staged. Good for fixing commit messages or adding forgotten files.

---

### Exercise 8 — View History and Find a Specific Commit

**Scenario:** Something broke. You need to find when it was introduced.

```bash
git log --oneline
# Shows all commits in short form

git log --oneline --since="3 days ago"
# Commits from last 3 days only

git log --oneline --author="Kundalik"
# Commits by a specific author

git show abc1234
# Shows the full diff of a specific commit
```

**What you learned:** `git log` is your history browser. Learn to filter it — it saves time during debugging.

---

### Exercise 9 — Stash Changes and Come Back Later

**Scenario:** You are in the middle of writing a test, but your team lead asks you to switch to a different branch urgently.

```bash
# You have uncommitted changes
git stash push -m "wip: half-written search test"

git stash list
# stash@{0}: wip: half-written search test

# Switch to another branch, do your work, come back
git checkout main
# ... do the urgent fix ...
git checkout feature/search-tests

git stash pop
# Your half-written test is back
```

**What you learned:** Stash is a temporary shelf. Use it when you need to switch context without committing incomplete work.

---

### Exercise 10 — Connect to GitHub and Push

**Scenario:** Your local repo is ready. Push it to GitHub.

```bash
# On GitHub, create a new empty repository first
# Then in your local terminal:

git remote add origin https://github.com/your-username/my-automation-project.git
git remote -v
# Shows the remote URL

git push -u origin main
# -u sets the upstream tracking so future pushes just need: git push
```

**What you learned:** `remote` is just a pointer to a URL. `-u` links your local branch to the remote branch so Git knows where to push/pull.

---

## Medium Exercises

---

### Exercise 11 — Simulate and Resolve a Merge Conflict

**Scenario:** Two developers edited the same line. Git cannot auto-merge.

```bash
# On main
echo "driver = ChromeDriver()" > config.py
git add config.py && git commit -m "feat: add chrome driver setup"

# On a feature branch
git checkout -b feature/firefox-support
echo "driver = FirefoxDriver()" > config.py
git add config.py && git commit -m "feat: switch to firefox driver"

# Back to main, try to merge
git checkout main
git merge feature/firefox-support
# CONFLICT — Git cannot decide which line to keep
```

Open `config.py`. You will see:
```
<<<<<<< HEAD
driver = ChromeDriver()
=======
driver = FirefoxDriver()
>>>>>>> feature/firefox-support
```

Fix it manually:
```python
driver = ChromeDriver()  # default, Firefox handled by flag
```

```bash
git add config.py
git commit -m "fix: resolve merge conflict in config driver setup"
```

**What you learned:** Conflict markers show both versions. You decide what to keep. Always read both sides before resolving.

---

### Exercise 12 — Rebase a Feature Branch onto Main

**Scenario:** Main has new commits. You want your feature branch to include them without a merge commit.

```bash
git checkout main
echo "base config updated" > base.py
git add base.py && git commit -m "chore: update base config"

git checkout feature/login-tests
git rebase main
# Git replays your feature commits on top of the latest main
```

Before rebase:
```
main:    A - B - C
feature:     B - D - E
```

After rebase:
```
main:    A - B - C
feature:         C - D - E
```

**What you learned:** Rebase gives a clean, linear history. Use it to keep your feature branch up to date with main before raising a PR.

---

### Exercise 13 — Cherry-Pick a Specific Commit

**Scenario:** A critical bug fix is on a different branch. You only want that one commit on main — not the whole branch.

```bash
git checkout bugfix/timeout-fix
git log --oneline
# def5678 fix: increase timeout for API calls
# abc1234 wip: refactor test helpers (you do NOT want this)

git checkout main
git cherry-pick def5678
# Only the timeout fix commit is applied to main
```

**What you learned:** Cherry-pick lets you pick individual commits across branches. Useful for hotfixes.

---

### Exercise 14 — Use git blame to Find Who Broke Something

**Scenario:** A test started failing. You want to know who last changed the failing line.

```bash
git blame tests/login_test.py
# Each line shows: commit hash | author | date | line content

# Example output:
# a1b2c3d4 (Kundalik 2024-05-10 10:30:00 +0530 15) driver.find_element(By.ID, "username")
```

Then inspect that commit:
```bash
git show a1b2c3d4
# Shows the full change — what was added, what was removed
```

**What you learned:** `git blame` maps every line to the commit that last changed it. Use it to understand context, not to blame people.

---

### Exercise 15 — Reset vs Revert — Know the Difference

**Scenario:** You pushed a bad commit. You need to undo it safely.

**Option 1 — Reset (only use on local / unpushed commits):**
```bash
git reset --hard HEAD~1
# Deletes the commit entirely. Dangerous on pushed commits — it rewrites history.
```

**Option 2 — Revert (safe for pushed commits):**
```bash
git revert abc1234
# Creates a NEW commit that undoes the changes of abc1234
# History is preserved. Safe for shared branches.

git log --oneline
# You will see: "Revert: feat: bad commit message"
```

**Rule to remember:**
- `reset` = erase history (only local)
- `revert` = add an undo commit (safe for shared branches like main)

---

### Exercise 16 — Track What Changed Between Two Branches

**Scenario:** Before raising a PR, check what your branch has that main does not.

```bash
# Commits your branch has that main does not
git log main..feature/login-tests --oneline

# Files that are different
git diff main..feature/login-tests --name-only

# Full diff
git diff main..feature/login-tests
```

**What you learned:** Always review your own diff before raising a PR. You catch mistakes — typos, debug logs, commented code — before reviewers do.

---

### Exercise 17 — Use .gitignore to Exclude Files

**Scenario:** Your project generates test reports and log files. You do not want to commit them.

Create `.gitignore`:
```
# Test output
test-results/
*.log
*.xml

# IDE files
.idea/
.vscode/

# Environment
.env
node_modules/
```

```bash
git add .gitignore
git commit -m "chore: add gitignore for test artifacts and IDE files"
```

**What you learned:** Files listed in `.gitignore` are invisible to Git. Add it early — cleaning up committed artifacts later is painful.

---

### Exercise 18 — Amend the Last Commit Message

**Scenario:** You just committed with a typo in the message — and you have NOT pushed yet.

```bash
git commit --amend -m "feat: add login page test with valid credentials"
# The last commit message is updated

git log --oneline
# Shows the corrected message
```

> Never amend a commit that has already been pushed to a shared branch — it rewrites history and causes problems for others.

---

### Exercise 19 — Fetch vs Pull — Know the Difference

**Scenario:** Your team pushed changes. You want to check what changed before merging.

```bash
git fetch origin
# Downloads remote changes but does NOT merge them
# Your local branch is untouched

git log main..origin/main --oneline
# See what commits are on remote that you don't have locally

git pull origin main
# fetch + merge in one step — brings remote changes into your local branch
```

**What you learned:** Use `fetch` when you want to inspect first. Use `pull` when you are ready to merge.

---

### Exercise 20 — Tag a Release

**Scenario:** The regression suite passed. Mark this commit as a release.

```bash
git tag -a v1.0.0 -m "Release: regression suite passed for sprint 10"
git push origin v1.0.0

git tag
# Lists all tags

git show v1.0.0
# Shows the tag details and the commit it points to
```

**What you learned:** Tags are permanent pointers to specific commits. Use them to mark test milestones or release checkpoints.
