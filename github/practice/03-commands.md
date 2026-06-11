# Git practice commands - Day 03 - 11 June 2026

## Setup

- git init
- git config --global user.name "username"
- git config --global user.email "jk@gmail.com"
- git config --local user.name
- git config --local user.eamil
- git config --list

## Initialise Project

- git init
- git clone <repoURL>
- git clone <repoURL> -b <branchName>
- git remote -v
- git remote add origin <repoURL>
- git remote remove origin <repoURL>

## Logs

- git status
- git log
- git log --oneline
- git log --oneline --graph
- git log main..featureA --oneline --graph
- git log -10 --oneline
- git diff
- git diff --staged
- git diff main..featureA
- git diff main..featureA --name-only
- git show <commitID>
- git blame <fileName>

## Branching

- git branch
- git branch -a
- git branch <branchA>
- git branch -d <branchName>
- git branch -D <branchName>
- git push origin --delete <branchName>
- git switch <branchName>
- git switch -c <branchName>
- git checkout <branchName>
- git checkout -b <branchName>

## Staging & Committing

- git add .
- git add \*
- git add \*.md
- git add <fileName>
- git add -A
- git add -all
- git add -p
- git commit -m "message"

## Reset & Restore staging

- git reset HEAD <fileName>
- git restore --stage <fileName>
- git restore --stage .

## Git Stash

- git stash
- git stash list
- git stash push -m "stashName"
- git stash pop
- git stash apply stash@{0}
- git stash drop stash@{0}
- git stash clear
