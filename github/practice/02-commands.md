# Day 02 - 10 June 2026

## Commands practice

- git config --global user.name
- git config --global user.email
- git config --list

## Setup

- git init
- git clone <reporURL>
- git clone <repoURL> --branch <BranchName>
- git remote -v
- git remote add origin <repoUrl>
- git remove remove origin <repoURL>

## Logs and Status

- git status
- git log
- git log --oneline
- git log --oneline --graph
- git log main..<featureA> --oneline --graph
- git diff
- git diff --staged
- git diff main..featureA
- git diff main..featureA --name-only
- git show <commit>
- git blame <file>

## Branching

- git branch
- git branch -a
- git branch <featureA>
- git branch -d <featureA>
- git branch -D <featureA>
- git push origin --delete <branch>
- git checkout <featureA>
- git checkout -b <featureA>
- git switch <featureA>
- git switch -c <featureB>

## Staging & Commiting

- git add .
- git add \*
- git add \*.js
- git add <fileName>
- git add -p
- git commit -m "feat(fileName): commit message"
- git reset HEAD <fileName>👈

## Push & Pull

- git stash
- git stash list
- git stash push -m <commit msg>
- git stash pop
- git stash apply stash@{0}
- git stash drop stash@{0}
- git stash clear
