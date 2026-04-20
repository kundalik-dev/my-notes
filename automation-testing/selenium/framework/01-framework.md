# Selenium with C# framework Notes.

## ✅ Page Object Design Pattern (POM)

### 🔹 Simple Explanation

**Page Object Model (POM)** is a design pattern in Selenium where:

- Each **web page = one class**
- Web elements = **variables**
- Actions on page = **methods**

👉 It separates **test logic** from **UI element handling**

---

### 🔹 Example (C# Selenium)

```csharp
public class LoginPage
{
    IWebDriver driver;

    public LoginPage(IWebDriver driver)
    {
        this.driver = driver;
    }

    IWebElement Username => driver.FindElement(By.Id("username"));
    IWebElement Password => driver.FindElement(By.Id("password"));
    IWebElement LoginBtn => driver.FindElement(By.Id("login"));

    public void Login(string user, string pass)
    {
        Username.SendKeys(user);
        Password.SendKeys(pass);
        LoginBtn.Click();
    }
}
```

👉 Test class will just call:

```csharp
loginPage.Login("admin", "1234");
```

---

## 🔹 Why we use POM (Uses / Benefits)

### 🎯 Interview Key Points

- **Code Reusability** → Same page methods reused across tests
- **Maintainability** → UI change = update only one class
- **Readability** → Clean and easy-to-understand tests
- **Separation of Concerns** → Test logic vs UI handling separated
- **Scalability** → Easy to manage large test suites

---

## 🔹 Types of Page Object Design

| Type             | Description                                         |
| ---------------- | --------------------------------------------------- |
| **POM (Basic)**  | Elements + methods in same class                    |
| **Page Factory** | Uses annotations (`FindsBy`) to initialize elements |
| **Hybrid POM**   | Combines POM + utilities + base classes             |

---

## 🔹 POM vs Without POM

| Without POM            | With POM               |
| ---------------------- | ---------------------- |
| Repeated code in tests | Centralized page logic |
| Hard to maintain       | Easy to maintain       |
| Poor readability       | Clean structure        |
| High duplication       | Reusable methods       |

---

## 🔹 Important Interview Questions

1. What is Page Object Model and why is it used?
2. Difference between POM and Page Factory?
3. How does POM improve maintainability?
4. Can we use POM without Page Factory?
5. What are drawbacks of POM? (👉 Extra classes, initial setup time)

---

## ✅ POM vs Page Factory

### 🔹 Key Difference (Interview Table)

| Feature                | POM (Page Object Model)           | Page Factory                                  |
| ---------------------- | --------------------------------- | --------------------------------------------- |
| Concept                | Design pattern                    | Implementation of POM                         |
| Element Initialization | Manual (`FindElement`)            | Automatic using attributes                    |
| Syntax                 | More code                         | Cleaner, less code                            |
| Performance            | Slightly slower (find every time) | Faster (lazy initialization)                  |
| Maintainability        | Good                              | Better (less duplication)                     |
| Selenium Support       | Fully supported                   | Deprecated in Selenium 4 (⚠️ important point) |

---

## 🔹 Code Difference (C#)

### 👉 POM (Manual)

```csharp id="k1p9x3"
IWebElement username => driver.FindElement(By.Id("username"));
```

### 👉 Page Factory

```csharp id="z8n2q7"
[FindsBy(How = How.Id, Using = "username")]
public IWebElement Username { get; set; }
```

---

## 🔹 Can we use POM without Page Factory?

### ✔️ YES (Very Important Interview Point)

👉 **POM is independent**

- Page Factory is just a helper tool
- You can fully implement POM using `FindElement`

### 🎯 Interview Answer

> “Yes, POM can be used without Page Factory. In fact, in Selenium 4, Page Factory is deprecated, so using POM with direct `FindElement` is the recommended approach.”

---

## 🔹 Key Points (Quick Revision)

- POM = Design pattern
- Page Factory = Way to implement POM
- Page Factory uses attributes (`FindsBy`)
- Selenium 4 → Page Factory deprecated
- Modern approach → **POM + explicit waits + clean methods**

---

## 🔹 Important Interview Questions

1. Why is Page Factory deprecated in Selenium 4?
2. Which approach do you prefer in real projects and why?
3. What are limitations of Page Factory?
4. How do you handle dynamic elements in POM?
5. What is lazy initialization in Page Factory?

---
