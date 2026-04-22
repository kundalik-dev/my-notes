# Fullstack

A comprehensive learning project and roadmap for fullstack development using the MERN stack with TypeScript.

## Overview

This repository serves as a personal learning journey through fullstack development, focusing on modern web technologies. It includes setup guides, practice projects, and organized notes covering various aspects of fullstack development.

## Project Structure

### Root Files

- `mern-ts-roadmap.html` - The main roadmap document outlining the learning path
- `.gitignore` - Git ignore rules for the project
- `README.md` - This file

### 01 vite/

Contains Vite.js setup and practice projects:

- `01-setup-vite/` - Basic Vite setup with React and TypeScript
- `02-practice/` - Practice exercises and examples

### my-notes/

Organized collection of learning notes and documentation:

- `api-testing/` - API testing methodologies and tools
- `automation-testing/` - Automated testing frameworks
  - `playwright-automation/` - Playwright testing notes
  - `selenium/` - Selenium automation
    - `framework/` - Testing framework setup
    - `installation/` - Installation guides
- `javascript/` - JavaScript concepts and best practices
- `manual/` - Manual testing and QA notes
- `react/` - React.js framework notes
- `sql/` - Database and SQL knowledge
- `typescript/` - TypeScript language features
- `vite/` - Vite build tool documentation

## Technologies Covered

- **Frontend**: React, TypeScript, Vite
- **Backend**: Node.js, Express.js (MERN stack)
- **Database**: MongoDB
- **Testing**: Playwright, Selenium, API testing
- **Languages**: JavaScript, TypeScript, SQL
- **Tools**: Vite, npm/pnpm, Git

## Getting Started

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd "12 Fullstack"
   ```

2. **For Vite projects**

   ```bash
   cd "01 vite/01-setup-vite"
   pnpm install
   pnpm dev
   ```

3. **Explore the notes**
   - Navigate through the `my-notes/` directory
   - Each subdirectory contains markdown files with learning notes
   - The `mern-ts-roadmap.html` provides the overall learning structure

## Architecture

```
PROJECTS/
│
├── DEV/                            ← Real builds: tools, apps, SaaS prototypes
│   ├── active/                     ← Currently being worked on
│   │   └── project-name/
│   │       ├── src/
│   │       ├── public/
│   │       ├── docs/               ← Project-specific notes, decisions
│   │       ├── README.md
│   │       ├── CHANGELOG.md
│   │       └── CLAUDE.md           ← AI memory: context, patterns, decisions
│   ├── experiments/                ← POCs, throwaway builds, "what if" spikes
│   │   └── try-nextjs-auth/
│   └── templates/                  ← Reusable starters you've built
│       ├── nextjs-saas-starter/
│       └── python-cli-starter/
│
├── QA/                             ← All testing work: frameworks, practice, evidence
│   ├── selenium/
│   │   ├── frameworks/
│   │   │   └── selenium-pom/       ← Page Object Model practice framework
│   │   │       ├── src/
│   │   │       ├── test-cases/     ← Test case docs (manual + automated)
│   │   │       ├── screenshots/    ← Bug evidence, test run captures
│   │   │       ├── reports/        ← HTML/Allure test reports
│   │   │       └── CLAUDE.md       ← AI memory for this framework
│   │   └── practice/               ← Standalone scripts and experiments
│   ├── playwright/
│   │   ├── frameworks/
│   │   │   └── playwright-ts/
│   │   │       ├── src/
│   │   │       ├── test-cases/
│   │   │       ├── screenshots/
│   │   │       ├── reports/
│   │   │       └── CLAUDE.md
│   │   └── practice/
│   ├── cypress/
│   │   └── frameworks/
│   │       └── cypress-bdd/
│   │           ├── src/
│   │           ├── test-cases/
│   │           ├── screenshots/
│   │           ├── reports/
│   │           └── CLAUDE.md
│   ├── appium/                     ← Mobile automation (Android/iOS)
│   │   └── frameworks/
│   └── manual/                     ← Manual test cases, checklists, test plans
│       ├── test-cases/
│       └── bug-reports/
│
├── API/                            ← API testing across tools and languages
│   ├── postman/
│   │   ├── collections/            ← Exported .json collection files
│   │   ├── environments/           ← env configs (dev, staging, prod)
│   │   └── docs/
│   ├── python-requests/            ← Python API test scripts (requests / pytest)
│   │   ├── src/
│   │   ├── test-cases/
│   │   └── CLAUDE.md
│   ├── rest-assured/               ← Java-based API testing
│   │   └── src/
│   └── graphql/                    ← GraphQL query testing
│       └── queries/
│
├── PERFORMANCE/                    ← Load testing, stress testing
│   ├── jmeter/
│   │   ├── test-plans/             ← .jmx files
│   │   ├── results/                ← .jtl result files
│   │   ├── reports/                ← HTML dashboard exports
│   │   ├── docs/                   ← Setup notes, analysis
│   │   └── CLAUDE.md
│   └── k6/                         ← JS-based load testing
│       ├── scripts/
│       └── reports/
│
├── SQL/                            ← SQL practice and schema work
│   ├── mysql/
│   │   ├── queries/                ← Practice queries organized by concept
│   │   ├── schemas/                ← DDL files, ERDs
│   │   └── docs/
│   ├── postgresql/
│   │   ├── queries/
│   │   └── schemas/
│   └── challenges/                 ← LeetCode SQL, HackerRank SQL, etc.
│
├── PYTHON/                         ← Python practice, scripts, automation
│   ├── scripts/                    ← Utility scripts you actually use
│   ├── practice/                   ← Learning exercises, course code
│   │   ├── fastapi/
│   │   ├── pandas/
│   │   └── algorithms/
│   └── CLAUDE.md
│
├── JAVASCRIPT/                     ← JS/TS practice and builds
│   ├── vanilla/                    ← Plain HTML/CSS/JS
│   ├── react/                      ← React component practice
│   ├── nextjs/                     ← Next.js projects and experiments
│   ├── node/                       ← Node.js scripts and APIs
│   └── CLAUDE.md
│
└── ARCHIVE/                        ← Completed, abandoned, or dead projects
    ├── DEV/
    ├── QA/
    └── API/
```

### `DAILY/` — Your Brain Dump Hub

> Feed this folder every day. This is where AI helps you most.

```
DAILY/
├── YYYY/
│   └── YYYY-MM/
│       ├── YYYY-MM-DD.md      ← Daily note (copy from daily-template.md)
│       └── ...
├── WEEKLY/
│   ├── YYYY-W01.md            ← Weekly review (copy from weekly-template.md)
│   └── YYYY-W02.md
├── MONTHLY/
│   ├── YYYY-01.md             ← Monthly review (copy from monthly-template.md)
│   └── YYYY-02.md
├── YEARLY/
│   └── YYYY-review.md         ← Annual review (copy from yearly-template.md)
├── GOALS/
│   ├── YYYY-Q1-goals.md       ← Quarterly goals (copy from goals-template.md)
│   ├── YYYY-Q2-goals.md
│   ├── YYYY-Q3-goals.md
│   ├── YYYY-Q4-goals.md
│   └── YYYY-annual.md         ← Annual goals (copy from goals-template.md)
└── TEMPLATES/
    ├── daily-template.md      ← YAML frontmatter + structured daily log
    ├── weekly-template.md     ← Week review + habit tracker + SaaS pulse
    ├── monthly-template.md    ← Month review + finance + metrics snapshot
    ├── yearly-template.md     ← Annual review + life scorecard + next year setup
    └── goals-template.md      ← OKR-lite goals for quarterly + annual use
```

### Template Overview

| Template              | Cadence            | Key Sections                                                            |
| --------------------- | ------------------ | ----------------------------------------------------------------------- |
| `daily-template.md`   | Every day          | Top 3, task list by area, time blocks, log, EOD review, score           |
| `weekly-template.md`  | Every Friday       | Last week review, weekly goals, project snapshot, SaaS pulse, habits    |
| `monthly-template.md` | Month end          | Goals review, achievements, finance, SaaS metrics, life score           |
| `yearly-template.md`  | Dec 31 / Jan 1     | Year in review, life scorecard, finance, lessons, next year setup       |
| `goals-template.md`   | Quarterly + Annual | OKR-lite per life area, anti-goals, weekly check-in log, mid/end review |

### Template Design Principles

- All templates use YAML frontmatter — machine-readable, AI-queryable
- Each template links up the chain: daily → weekly → monthly → yearly → goals
- `<!-- EXTENSIONS: -->` comments mark where to add features later (habits, automations, integrations)
- Consistent scoring (1–10) across all levels for AI trend analysis

## Learning Goals

- Master modern JavaScript and TypeScript
- Build responsive React applications
- Set up efficient development environments with Vite
- Understand fullstack architecture (MERN)
- Implement comprehensive testing strategies
- Document and organize technical knowledge

## Contributing

This is a personal learning repository, but feel free to:

- Add new notes and examples
- Improve existing documentation
- Share additional resources

## License

This project is for personal learning purposes.
