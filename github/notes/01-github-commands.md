# Git & Github commands

## Setup & Configuration

| Command                                  | Description              |
| ---------------------------------------- | ------------------------ |
| `git config --global user.name "Name"`   | Set global username      |
| `git config --global user.email "email"` | Set global email         |
| `git config --list`                      | View all config settings |

---

## Repository Setup

| Command                             | Description                           |
| ----------------------------------- | ------------------------------------- |
| `git init`                          | Initialize a new local Git repository |
| `git clone <url>`                   | Clone a remote repository locally     |
| `git clone <url> --branch <branch>` | Clone a specific branch               |
| `git remote -v`                     | View remote connections               |
| `git remote add origin <url>`       | Add a remote origin                   |
| `git remote remove origin <url>`    | Remove remote origin                  |

---

## Daily Status & Info

| Command                     | Description                                                  |
| --------------------------- | ------------------------------------------------------------ |
| `git status`                | Show working tree status (modified, staged, untracked files) |
| `git log`                   | Show commit history                                          |
| `git log --oneline`         | Show compact commit history (one line each)                  |
| `git log --oneline --graph` | Visual branch graph in terminal                              |
| `git diff`                  | Show unstaged changes                                        |
| `git diff --staged`         | Show staged changes before committing                        |
| `git show <commit>`                        | Show details of a specific commit                            |
| `git blame <file>`                         | Show who changed each line in a file                         |
| `git log <branch-a>..<branch-b> --oneline` | Commits in branch-b that branch-a is missing                 |
| `git log main..qa-practice --oneline`      | Commits in qa-practice that main doesn't have                |
| `git diff main..qa-practice --name-only`   | Files that differ between two branches (file names only)     |
| `git diff main..qa-practice`               | Full file-level diff between two branches                    |

---

## Branching

| Command                             | Description                                |
| ----------------------------------- | ------------------------------------------ |
| `git branch`                        | List all local branches                    |
| `git branch -a`                     | List all local and remote branches         |
| `git branch <name>`                 | Create a new branch                        |
| `git checkout <branch>`             | Switch to a branch                         |
| `git checkout -b <branch>`          | Create and switch to a new branch          |
| `git switch <branch>`               | Switch to a branch (modern syntax)         |
| `git switch -c <branch>`            | Create and switch to a new branch (modern) |
| `git branch -d <branch>`            | Delete a local branch (safe)               |
| `git branch -D <branch>`            | Force delete a local branch                |
| `git push origin --delete <branch>` | Delete a remote branch                     |

---

## Staging & Committing

| Command                           | Description                                |
| --------------------------------- | ------------------------------------------ |
| `git add <file>`                  | Stage a specific file                      |
| `git add .`                       | Stage all changed files                    |
| `git add -p`                      | Interactively stage chunks of changes      |
| `git commit -m "message"`         | Commit staged changes with a message       |
| `git commit --amend -m "message"` | Edit the last commit message (before push) |
| `git reset HEAD <file>`           | Unstage a file (keep changes)              |

---

## Push & Pull

| Command                                | Description                                       |
| -------------------------------------- | ------------------------------------------------- |
| `git push origin <branch>`             | Push branch to remote                             |
| `git push -u origin <branch>`          | Push and set upstream tracking                    |
| `git push --force-with-lease`          | Safe force push (won't overwrite others' changes) |
| `git pull`                             | Fetch and merge from tracked remote branch        |
| `git pull origin <branch>`             | Pull a specific remote branch                     |
| `git pull --allow-unrelated-histories` | Merge repos with no common history                |
| `git fetch`                            | Download remote changes without merging           |
| `git fetch --all`                      | Fetch all remotes                                 |

---

## Merging & Rebasing

| Command                      | Description                                 |
| ---------------------------- | ------------------------------------------- |
| `git merge <branch>`         | Merge a branch into the current branch      |
| `git merge --no-ff <branch>` | Merge with a merge commit (no fast-forward) |
| `git merge --abort`          | Abort an in-progress merge                  |
| `git rebase <branch>`        | Rebase current branch onto another          |
| `git rebase --abort`         | Abort a rebase in progress                  |
| `git rebase --continue`      | Continue rebase after resolving conflict    |
| `git cherry-pick <commit>`   | Apply a specific commit onto current branch |

---

## Stashing (Save Work Temporarily)

| Command                       | Description                                |
| ----------------------------- | ------------------------------------------ |
| `git stash`                   | Save uncommitted changes temporarily       |
| `git stash push -m "message"` | Stash with a descriptive name              |
| `git stash list`              | List all stashes                           |
| `git stash pop`               | Apply latest stash and remove it           |
| `git stash apply stash@{0}`   | Apply a specific stash without removing it |
| `git stash drop stash@{0}`    | Delete a specific stash                    |
| `git stash clear`             | Remove all stashes                         |

---

## Undoing Changes

| Command                       | Description                                                              |
| ----------------------------- | ------------------------------------------------------------------------ |
| `git restore <file>`          | Discard unstaged changes in a file                                       |
| `git restore --staged <file>` | Unstage a file                                                           |
| `git reset --soft HEAD~1`     | Undo last commit, keep changes staged                                    |
| `git reset --mixed HEAD~1`    | Undo last commit, keep changes unstaged                                  |
| `git reset --hard HEAD~1`     | Undo last commit and discard all changes                                 |
| `git revert <commit>`         | Create a new commit that undoes a past commit (safe for shared branches) |
| `git clean -fd`               | Delete all untracked files and directories                               |

---

## Tags (Releases / Test Milestones)

| Command                         | Description              |
| ------------------------------- | ------------------------ |
| `git tag`                       | List all tags            |
| `git tag <tagname>`             | Create a lightweight tag |
| `git tag -a <tagname> -m "msg"` | Create an annotated tag  |
| `git push origin <tagname>`     | Push a tag to remote     |
| `git push origin --tags`        | Push all tags to remote  |

---

## Working with Pull Requests (via GitHub CLI)

| Command                                            | Description                         |
| -------------------------------------------------- | ----------------------------------- |
| `gh pr create`                                     | Create a pull request interactively |
| `gh pr create --title "title" --body "desc"`       | Create a PR with title and body     |
| `gh pr list`                                       | List open pull requests             |
| `gh pr view <number>`                              | View a specific PR                  |
| `gh pr checkout <number>`                          | Check out a PR branch locally       |
| `gh pr merge <number>`                             | Merge a pull request                |
| `gh pr review <number> --approve`                  | Approve a PR                        |
| `gh pr review <number> --request-changes -b "msg"` | Request changes on a PR             |

---

## Useful Automation Tester Workflows

| Command                             | Description                                   |
| ----------------------------------- | --------------------------------------------- |
| `git log --author="Name" --oneline` | Filter commits by author                      |
| `git log --since="2 days ago"`      | Show commits from last 2 days                 |
| `git shortlog -sn`                  | Summary of commits per author                 |
| `git bisect start`                  | Start binary search to find a bad commit      |
| `git bisect good <commit>`          | Mark a commit as good                         |
| `git bisect bad <commit>`           | Mark a commit as bad                          |
| `git grep "keyword"`                | Search for a keyword across all tracked files |
