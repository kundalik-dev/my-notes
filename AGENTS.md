# AGENTS.md

## Project Purpose

This repository is a personal interview-preparation notes workspace for automation testing and QA roles.

The owner is preparing for the next automation testing interview with:

- 5.5 years of total testing experience.
- 3 years of automation testing experience.
- Real project experience mainly in C#, NUnit, Selenium, and manual testing.
- Previous learning exposure to Java, Selenium, and TestNG around 4 years ago, requiring revision.
- Current learning focus on Playwright with JavaScript/TypeScript.
- Additional preparation areas: Jenkins, Git, GitHub, Docker, CI/CD, SQL, API manual testing, API automation testing, logical programming, and English interview communication.

The main goal is to become interview-ready within the next 2 months through structured notes, revision questions, code examples, practical framework examples, and daily AI interview practice.

## How Agents Should Help

When editing or adding notes in this repository:

- Write notes for interview readiness, not academic theory.
- Prefer simple English that is easy to speak in interviews.
- Include "interview answer" sections when the topic is commonly asked.
- Include practical examples from QA and automation projects.
- Use the owner's real strengths first: manual testing, Selenium, C#, NUnit, POM, test cases, bug reports, regression testing, and framework maintenance.
- Clearly label topics that are learning/revision areas, especially Playwright, Java/TestNG, API testing, Jenkins, Docker, and CI/CD.
- Help the owner avoid overclaiming experience. Phrase newer skills as "learning", "practicing", or "basic understanding" unless the note is explicitly about real work experience.
- Add code examples when useful, especially in C#, Java, JavaScript, TypeScript, SQL, and API testing.
- Keep explanations practical, structured, and revision-friendly.

## Current Knowledge Profile

Strong areas:

- Manual testing concepts.
- Test case design and execution.
- Bug reporting and defect life cycle.
- Regression, smoke, sanity, functional, and retesting concepts.
- Selenium WebDriver.
- C# automation.
- NUnit.
- Page Object Model.
- Locator strategies.
- Explicit waits and synchronization.
- Basic SQL knowledge.

Needs revision:

- Java basics for automation.
- Selenium with Java.
- TestNG annotations and framework flow.
- Java collections and logical programs.
- Git and GitHub commands.
- Jenkins pipeline basics.

Currently learning:

- Playwright with JavaScript/TypeScript.
- API manual testing.
- API automation testing.
- Docker basics.
- CI/CD concepts.
- Better English communication for interviews.

## Repository Structure

Important folders currently include:

- `automation-testing/selenium/` - Selenium notes, installation, and framework concepts.
- `automation-testing/playwright-automation/` - Playwright with JavaScript/TypeScript topics.
- `jenkins/` - Jenkins topics, resources, and interview questions.
- `github/notes/` - Git and GitHub notes.
- `vite/` - Vite setup notes.

When adding new notes, prefer these folders:

- `automation-testing/selenium/` for Selenium, C#, NUnit, Java, and TestNG.
- `automation-testing/playwright-automation/` for Playwright JS/TS.
- `api-testing/` for Postman, REST API basics, status codes, authentication, and API automation.
- `manual-testing/` for test cases, bug reports, testing concepts, and interview answers.
- `sql/` for SQL queries and interview practice.
- `logical-programs/` for coding interview programs.
- `english-communication/` for spoken interview practice, self-introduction, project explanation, and HR answers.
- `jenkins/` for Jenkins notes.
- `github/notes/` for Git and GitHub notes.
- `docker/` for Docker basics and CI usage.

Create missing folders only when needed.

## Note Format

Prefer this structure for new topic notes:

````markdown
# Topic Name

## Simple Explanation

Short explanation in easy English.

## Why It Is Used

- Practical reason 1
- Practical reason 2

## Real Project Example

Example based on manual testing or automation testing work.

## Code Example

```language
// small focused example
```

## Interview Answer

Short answer that can be spoken in an interview.

## Common Interview Questions

1. Question?
2. Question?

## Quick Revision

- Key point
- Key point
````

## Writing Style

- Use clear headings.
- Prefer bullet points for quick revision.
- Keep sentences short and direct.
- Explain abbreviations before using them heavily.
- Avoid long paragraphs.
- Avoid unnecessary motivational content.
- Use examples from QA work wherever possible.
- Use ASCII characters unless editing a file that already intentionally uses Unicode.

## Code Style Guidance

For C# Selenium/NUnit examples:

- Prefer Selenium 4 style.
- Prefer Page Object Model with direct `FindElement` or `By` locators.
- Use explicit waits instead of fixed sleeps.
- Keep tests readable and close to real interview examples.
- Use NUnit attributes such as `[SetUp]`, `[Test]`, and `[TearDown]`.

For Java Selenium/TestNG examples:

- Keep Java examples beginner-friendly because this area is revision.
- Explain TestNG annotations clearly.
- Show equivalent concepts compared with NUnit when useful.

For Playwright JS/TS examples:

- Prefer Playwright test runner examples.
- Prefer role, text, label, and test-id locators before brittle CSS/XPath.
- Include assertions using `expect`.
- Mention auto-waiting where relevant.

For API testing examples:

- Start with manual API testing concepts: methods, status codes, headers, body, auth, Postman.
- Then add automation examples gradually.
- Explain request, response, schema, and validation clearly.

## Interview Preparation Priorities

Agents should help build notes in this priority order:

1. Strong project explanation for C# Selenium/NUnit automation experience.
2. Manual testing interview questions and real examples.
3. Selenium framework concepts: POM, waits, locators, screenshots, reports, data-driven testing.
4. C# and NUnit interview questions.
5. Java, Selenium, and TestNG revision.
6. Playwright with JavaScript/TypeScript basics and framework structure.
7. API manual testing and API automation.
8. SQL interview queries.
9. Jenkins, Git, GitHub, Docker, and CI/CD.
10. Logical programs.
11. English communication practice.

## Communication Practice

When creating interview practice content, include:

- A short correct answer.
- A more natural spoken answer.
- Common mistakes to avoid.
- Follow-up questions an interviewer may ask.
- Optional improved English version.

For project-experience answers, keep them honest:

- Say "I worked mainly with Selenium, C#, and NUnit" for real experience.
- Say "I am currently learning Playwright" for Playwright.
- Say "I have basic knowledge and am practicing API testing" for API testing until stronger notes/projects exist.

## Safety And Maintenance

- Do not delete existing personal notes unless explicitly asked.
- Do not reorganize large folders without permission.
- Keep generated notes easy to revise from a mobile or laptop screen.
- If a file contains encoding issues, avoid broad rewrites unless the user asks to clean it.
- When adding code, keep examples small enough to understand during interview revision.
