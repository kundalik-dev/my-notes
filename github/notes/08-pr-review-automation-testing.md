# PR Review in Automation Testing

## Why PR Review Matters

A PR review is not just about finding bugs. It is the moment where:
- Knowledge spreads across the team
- Standards are maintained
- Flaky tests are caught before they waste CI time
- The test suite stays maintainable over time

As an automation tester, you will both **give** reviews and **receive** them. Both sides require skill.

---

## The Reviewer's Mindset

Before opening the diff, ask yourself:

- What is this PR trying to do? (Read the description first)
- Does the approach make sense for what is being tested?
- Will this test actually catch a real bug?
- Will this test still work in 6 months when the UI changes?

> A review is not a competition. It is a conversation about making the code better.

---

## What to Look for When Reviewing Automation Test PRs

### 1. Test Structure and Independence

- [ ] Each test method has exactly one clear purpose
- [ ] Tests do not depend on each other — running them in any order should work
- [ ] `[SetUp]` / `@BeforeMethod` / `beforeEach` properly initializes the state
- [ ] `[TearDown]` / `@AfterMethod` / `afterEach` cleans up after itself
- [ ] No shared mutable state between tests

**Red flag:**
```csharp
// Test 2 assumes Test 1 already ran and created the user — WRONG
[Test]
public void TC_102_LoginWithCreatedUser()
{
    // depends on TC_101_CreateUser() having run first
}
```

**Correct:**
```csharp
[SetUp]
public void CreateTestUser() { /* creates user before every test */ }

[Test]
public void TC_102_Login_With_Valid_User() { /* self-contained */ }
```

---

### 2. Locator Quality

Locators break when the UI changes. Review locator choices carefully.

| Locator Type | Stability | Use? |
|-------------|-----------|------|
| `By.Id` | High — IDs are usually stable | Yes |
| `By.TestId` / `data-testid` | Highest — built for automation | Always preferred |
| `By.Name` | High | Yes |
| `By.LinkText` | Medium | Only for links |
| `By.CssSelector` | Medium — fragile with nesting | Use simple selectors |
| `By.XPath (absolute)` | Very Low | Never |
| `By.XPath (relative)` | Low–Medium | Last resort |
| `By.ClassName` | Low — classes change with styling | Avoid |

**Red flag — fragile XPath:**
```csharp
driver.FindElement(By.XPath("/html/body/div[3]/div[1]/form/input[2]"));
```

**Better:**
```csharp
driver.FindElement(By.Id("username"));
// or
page.GetByTestId("username-input");  // Playwright
```

---

### 3. Waits and Timing

This is the most common source of flaky tests. Check every wait strategy.

**Red flags:**
```csharp
Thread.Sleep(3000);        // hardcoded sleep — always wrong
driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(10); // implicit — unpredictable
```

**Correct:**
```csharp
// Explicit wait — waits for a specific condition
WebDriverWait wait = new WebDriverWait(driver, TimeSpan.FromSeconds(10));
IWebElement element = wait.Until(ExpectedConditions.ElementIsVisible(By.Id("username")));

// Playwright — auto-waits by default, no explicit wait needed
await page.GetByRole(AriaRole.Button, new() { Name = "Submit" }).ClickAsync();
```

**Ask during review:**
- Why is this wait needed? Is the page slow, or is there a race condition?
- Is the timeout realistic for the environment (CI can be slower than local)?

---

### 4. Assertions

Assertions are the proof that your test is actually testing something.

**Red flags — assertions that prove nothing:**
```csharp
Assert.IsNotNull(result);          // proves the object exists, not that it is correct
Assert.IsTrue(true);               // always passes — useless
Assert.AreEqual("", result.Text);  // asserting empty string — probably a mistake
```

**Good assertions — specific and meaningful:**
```csharp
Assert.AreEqual("Welcome, John!", dashboardPage.GetWelcomeMessage());
Assert.IsTrue(homePage.IsLoggedIn(), "User should be logged in after valid credentials");
Assert.AreEqual(3, cartPage.GetItemCount(), "Cart should have 3 items after adding product");
```

**Check:**
- Does the assertion actually verify what the test name says?
- Is the failure message clear enough to diagnose without re-running the test?
- Are all assertions reachable — is there dead code before them?

---

### 5. Page Object Quality

Page Objects should be the single source of truth for how the UI is accessed.

**Red flags:**
```csharp
// Locators mixed into test methods — wrong
[Test]
public void TC_101_Login()
{
    driver.FindElement(By.Id("username")).SendKeys("admin");  // locator in test
    driver.FindElement(By.Id("password")).SendKeys("pass");
    driver.FindElement(By.Id("loginBtn")).Click();
}
```

**Correct — locators in Page Object only:**
```csharp
// LoginPage.cs
public class LoginPage
{
    private readonly IWebDriver driver;
    private By UsernameField => By.Id("username");
    private By PasswordField => By.Id("password");
    private By LoginButton   => By.Id("loginBtn");

    public void Login(string username, string password)
    {
        driver.FindElement(UsernameField).SendKeys(username);
        driver.FindElement(PasswordField).SendKeys(password);
        driver.FindElement(LoginButton).Click();
    }
}

// LoginTest.cs
[Test]
public void TC_101_Login_With_Valid_Credentials()
{
    loginPage.Login("admin", "password");
    Assert.IsTrue(dashboardPage.IsLoaded());
}
```

**Check during review:**
- Are locators defined in the page object, not the test?
- Does the page object return meaningful objects or booleans — not raw `IWebElement`?
- Is the page object reused across multiple tests — or duplicated?

---

### 6. Test Data

**Red flags:**
```csharp
loginPage.Login("john@company.com", "Password123!");  // hardcoded real-looking credentials
loginPage.Login("admin", "admin");                    // default credentials — security risk
```

**Better approaches:**
```csharp
// Use a test data class or constants
loginPage.Login(TestData.ValidUser.Email, TestData.ValidUser.Password);

// Or read from a JSON / CSV file
var user = TestDataReader.GetUser("valid_user");
loginPage.Login(user.Email, user.Password);
```

**Check:**
- No real email addresses, real passwords, or real PII in test data
- Test data is not environment-specific — tests should run in any env
- Negative test data is covered (empty, too long, special characters)

---

### 7. CI and Pipeline Impact

When a PR changes framework code or configuration:

- [ ] Will existing tests still pass after this change?
- [ ] Does this increase the total test suite run time significantly?
- [ ] Are any new dependencies added — and are they justified?
- [ ] If Jenkinsfile / GitHub Actions is changed — does the pipeline still trigger correctly?

---

### 8. Comments and Readability

- [ ] Test name clearly says what is being tested (no `Test1`, `TestLoginPage`)
- [ ] No multi-line commented-out code blocks
- [ ] If there is a `TODO` or `FIXME` — it has a ticket reference
- [ ] Complex logic has a short comment explaining WHY (not WHAT)

---

## How to Write Review Comments

### Comment Tone — Important

Reviews are read by a person. Write comments the way you would speak in a polite conversation.

| Instead of... | Write... |
|---------------|---------|
| "This is wrong." | "This locator might break when the class name changes — could we use `data-testid` here?" |
| "Why did you do this?" | "Could you help me understand the reason for this wait? I want to make sure I am not missing context." |
| "Bad practice." | "Looks like this test depends on TC-101 running first. That could cause failures if tests run in parallel. Suggest making it self-contained." |

### Comment Categories

Use prefixes so the author knows how critical the comment is:

```
[MUST]    - Must be fixed before merge (broken test, security issue, wrong assertion)
[SHOULD]  - Should be fixed — important for quality but not blocking
[NIT]     - Minor style or naming issue — author can choose to fix or not
[QUESTION]- You need clarification before you can approve
[IDEA]    - A suggestion — no pressure to apply it
```

**Examples:**
```
[MUST] This assertion will always pass even if login fails.
       Assert.IsNotNull(driver.Title) does not verify login success.
       Suggest: Assert.AreEqual("Dashboard", dashboardPage.GetTitle())

[SHOULD] Thread.Sleep(2000) here will make this test flaky on slow CI machines.
         Suggest replacing with an explicit wait for the success message.

[NIT] Method name "clickBtn" could be more descriptive — "clickSubmitButton" or "submitForm"

[QUESTION] Is this test supposed to clean up the created user after the test runs?
           I do not see a teardown for user deletion.

[IDEA] We already have a LoginHelper class that does the same login flow.
       Could reuse that here if it fits.
```

---

## Approving a PR

Approve when:
- All `[MUST]` issues are resolved
- CI is green
- You understand what the tests are doing and agree with the approach
- No sensitive data was committed

Leave a final comment when approving:
```
Approved. TC-101 to TC-103 look solid. The explicit wait change in LoginPage is a good improvement.
```

Do not approve just because:
- The PR has been open for a long time
- You do not want to slow the person down
- You did not understand it but it "looks fine"

---

## Requesting Changes

Request changes when:
- A test has a fundamental flaw (always passes, wrong assertion)
- A locator is so fragile it will break immediately
- A `Thread.Sleep` is present
- Sensitive data is committed
- CI is failing

```
Requested changes. Two things to fix before this can merge:
1. [MUST] The assertion on line 45 will always pass — see comment.
2. [MUST] Thread.Sleep on line 62 — replace with explicit wait.
Everything else looks good.
```

---

## Receiving a Review — How to Respond

When you get review comments:

- Do not take comments personally — it is about the code, not you
- Respond to every comment — even if just to say "fixed" or "agreed"
- If you disagree, explain your reasoning politely
- Do not silently change things — always reply so the reviewer knows you addressed it

**Examples of good responses:**
```
Fixed — moved locator to LoginPage.cs as suggested.

Agreed — replaced Thread.Sleep with WebDriverWait for the success toast.

Good catch — I missed that this test would fail if run in parallel. Fixed the SetUp to create its own user.

I kept the XPath here because the element has no ID or test-id attribute yet. I raised TC-456 to ask the dev team to add one. Is that acceptable for now?
```

---

## Best Practices Summary

### As the PR Author
- Small, focused PRs — one feature area or ticket per PR
- Fill the description completely — what, why, how to test
- Self-review your own diff before requesting a review
- CI must be green before requesting review
- Reference your ticket in every PR
- Do not force push during review

### As the Reviewer
- Read the description before opening the diff
- Check for flaky patterns first: sleeps, bad locators, dependent tests
- Check assertions — do they actually prove the test passed correctly?
- Write kind, specific, actionable comments
- Use `[MUST]` / `[SHOULD]` / `[NIT]` prefixes
- Approve only when you genuinely understand and agree

### Always Remember
- A test that always passes is worse than no test — it gives false confidence
- A test that is hard to understand will be deleted instead of maintained
- CI green on the PR branch does not guarantee CI green on main — always check after merge
- One good reviewer comment can prevent a week of debugging flaky tests in CI

---

## PR Review Checklist (Print and Keep)

```
Before Approving — Check All:

STRUCTURE
[ ] Tests are independent — no test depends on another
[ ] SetUp and TearDown are used correctly
[ ] One test = one responsibility

LOCATORS
[ ] No absolute XPath
[ ] Prefers ID, data-testid, or role-based locators
[ ] Locators are in page objects, not in test methods

WAITS
[ ] No Thread.Sleep or hardcoded delays
[ ] Explicit waits used correctly
[ ] Timeout values are CI-safe (10–30 seconds typical)

ASSERTIONS
[ ] Assertions are specific, not just IsNotNull
[ ] Failure messages are meaningful
[ ] All paths in the test lead to an assertion

DATA
[ ] No hardcoded credentials or PII
[ ] Test data is externalized or uses constants
[ ] Edge cases are covered

GIT
[ ] Commit messages are clear and follow convention
[ ] Branch is up to date with main
[ ] No unrelated changes in this PR
[ ] CI is green

DESCRIPTION
[ ] PR title is clear
[ ] Description explains what and why
[ ] Ticket is referenced
[ ] How to run tests is mentioned
```
