# JavaScript String Methods

## Simple Explanation

A string is a sequence of characters like `"hello"`, `"QA Engineer"`, `"123"`.
JavaScript gives us built-in methods to work on strings — find, replace, cut, change case, and more.
These methods do NOT change the original string. They always return a new value.

---

## Why We Use It

- Clean and format user input.
- Search text in a string.
- Extract part of a string.
- Validate data in automation scripts.
- Manipulate test data in Playwright, Selenium, or API tests.

---

## Most Important Methods

### 1. `length` — Get string length

```js
const str = "hello";
console.log(str.length); // 5
```

> Interview use: Check if input field has minimum/maximum characters.

---

### 2. `toUpperCase()` / `toLowerCase()` — Change case

```js
const str = "Hello World";
console.log(str.toUpperCase()); // "HELLO WORLD"
console.log(str.toLowerCase()); // "hello world"
```

> Interview use: Case-insensitive comparison of strings.

---

### 3. `trim()` — Remove spaces from both ends

```js
const str = "   hello   ";
console.log(str.trim()); // "hello"
```

> Also: `trimStart()` removes leading spaces, `trimEnd()` removes trailing spaces.

> Interview use: Validate user input that may have accidental spaces.

---

### 4. `includes()` — Check if string contains a value

```js
const str = "I am a QA Engineer";
console.log(str.includes("QA"));      // true
console.log(str.includes("Developer")); // false
```

> Returns `true` or `false`.

> Interview use: Check if error message contains expected text in test assertion.

---

### 5. `indexOf()` — Find position of first occurrence

```js
const str = "hello world";
console.log(str.indexOf("world")); // 6
console.log(str.indexOf("xyz"));   // -1  (not found)
```

> Returns index number. Returns `-1` if not found.

---

### 6. `slice(start, end)` — Extract part of a string

```js
const str = "Hello World";
console.log(str.slice(0, 5));  // "Hello"
console.log(str.slice(6));     // "World"
console.log(str.slice(-5));    // "World"  (negative counts from end)
```

> `end` index is not included.

---

### 7. `substring(start, end)` — Similar to slice

```js
const str = "Hello World";
console.log(str.substring(0, 5)); // "Hello"
```

> Difference from `slice`: `substring` does not support negative indexes.

---

### 8. `replace()` — Replace first match

```js
const str = "Hello World";
console.log(str.replace("World", "QA")); // "Hello QA"
```

> Replaces only the **first** match.

---

### 9. `replaceAll()` — Replace all matches

```js
const str = "cat bat cat";
console.log(str.replaceAll("cat", "dog")); // "dog bat dog"
```

> Replaces **every** match in the string.

---

### 10. `split()` — Convert string to array

```js
const str = "apple,banana,mango";
console.log(str.split(",")); // ["apple", "banana", "mango"]

const str2 = "hello";
console.log(str2.split("")); // ["h","e","l","l","o"]
```

> Very commonly used with `.reverse().join()` to reverse a string.

---

### 11. `join()` — Convert array back to string

```js
const arr = ["hello", "world"];
console.log(arr.join(" ")); // "hello world"
console.log(arr.join("-")); // "hello-world"
```

> `join` is an array method but always used together with `split`.

---

### 12. `charAt(index)` — Get character at position

```js
const str = "hello";
console.log(str.charAt(0)); // "h"
console.log(str.charAt(4)); // "o"
```

> Same as `str[0]` but `charAt` is the older, safer way.

---

### 13. `startsWith()` / `endsWith()` — Check start or end

```js
const str = "Hello World";
console.log(str.startsWith("Hello")); // true
console.log(str.endsWith("World"));   // true
console.log(str.startsWith("World")); // false
```

---

### 14. `repeat()` — Repeat string n times

```js
const str = "ha";
console.log(str.repeat(3)); // "hahaha"
```

---

### 15. `padStart()` / `padEnd()` — Add padding

```js
const str = "5";
console.log(str.padStart(3, "0")); // "005"
console.log(str.padEnd(3, "0"));   // "500"
```

> Interview use: Format numbers like `001`, `002` in test IDs.

---

## Real Project Example

In a Playwright test, validate that an error message contains expected text:

```js
const errorMsg = await page.locator(".error").innerText();

// Use includes to check
if (errorMsg.toLowerCase().trim().includes("required")) {
  console.log("Validation message found");
}
```

---

## Common Interview Questions

1. What is the difference between `slice()` and `substring()`?
2. How do you reverse a string in JavaScript?
3. What does `split()` return?
4. What is the difference between `replace()` and `replaceAll()`?
5. How do you check if a string contains a specific word?
6. What does `trim()` do and when do you use it?
7. How do you convert a string to uppercase?
8. What does `indexOf()` return if the value is not found?

---

## Interview Answers (Spoken Style)

**Q: How do you reverse a string in JavaScript?**

> "I convert the string to an array using `split('')`, then use `reverse()` on the array, and finally join it back using `join('')`. This is the simplest and most readable approach."

```js
const str = "hello";
const reversed = str.split("").reverse().join("");
console.log(reversed); // "olleh"
```

---

**Q: Difference between `slice` and `substring`?**

> "Both extract part of a string. The main difference is that `slice` supports negative indexes, which count from the end of the string. `substring` does not support negative indexes — it treats them as zero."

---

## Quick Revision

| Method | What it does |
|---|---|
| `length` | Returns number of characters |
| `toUpperCase()` | Converts to all caps |
| `toLowerCase()` | Converts to all small |
| `trim()` | Removes spaces from both ends |
| `includes()` | Returns true/false if value exists |
| `indexOf()` | Returns index or -1 |
| `slice(s, e)` | Extracts part, supports negative index |
| `substring(s, e)` | Extracts part, no negative index |
| `replace()` | Replaces first match |
| `replaceAll()` | Replaces all matches |
| `split()` | String → Array |
| `join()` | Array → String |
| `charAt(i)` | Character at index |
| `startsWith()` | Check beginning |
| `endsWith()` | Check ending |
| `padStart()` | Add padding at start |
| `repeat(n)` | Repeat string n times |
