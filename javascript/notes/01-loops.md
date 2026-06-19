# Loops in JavaScript

## Simple Explanation

A loop repeats a block of code until a condition becomes false.
Instead of writing the same code 10 times, you write it once inside a loop.

---

## Types of Loops

| Loop         | Use When                                            |
| ------------ | --------------------------------------------------- |
| `for`        | You know how many times to repeat                   |
| `while`      | You repeat until a condition is false               |
| `do...while` | You want to run at least once, then check condition |
| `for...of`   | Loop over arrays, strings (values)                  |
| `for...in`   | Loop over object keys                               |
| `forEach`    | Loop over arrays (callback style)                   |

---

## 1. for Loop

```javascript
for (let i = 0; i < 5; i++) {
  console.log(i); // 0 1 2 3 4
}
```

**Structure:**

```
for (initialization; condition; update) {
  // code
}
```

- Runs when you know the exact number of iterations
- Most commonly asked in interviews

---

## 2. while Loop

```javascript
let i = 0;
while (i < 5) {
  console.log(i); // 0 1 2 3 4
  i++;
}
```

- Checks condition **before** running the code
- Use when you do not know exact count upfront

---

## 3. do...while Loop

```javascript
let i = 0;
do {
  console.log(i); // runs at least once even if condition is false
  i++;
} while (i < 5);
```

- Checks condition **after** running the code
- Guaranteed to run **at least once**

---

## 4. for...of Loop

```javascript
const fruits = ["apple", "banana", "mango"];

for (const fruit of fruits) {
  console.log(fruit); // apple, banana, mango
}
```

- Works on **arrays**, **strings**, **maps**, **sets**
- Gives you the **value** directly

```javascript
// Works on string too
for (const char of "hello") {
  console.log(char); // h e l l o
}
```

---

## 5. for...in Loop

```javascript
const person = { name: "Raj", age: 25, city: "Pune" };

for (const key in person) {
  console.log(key, person[key]);
  // name Raj
  // age 25
  // city Pune
}
```

- Works on **objects**
- Gives you the **key** (property name)
- Avoid using on arrays — use `for...of` instead

---

## 6. forEach

```javascript
const numbers = [10, 20, 30];

numbers.forEach((num, index) => {
  console.log(index, num); // 0 10, 1 20, 2 30
});
```

- Array method, not a keyword
- Cannot use `break` or `continue` inside it
- Good for simple iterations over arrays

---

## break and continue

```javascript
// break - stops the loop completely
for (let i = 0; i < 5; i++) {
  if (i === 3) break;
  console.log(i); // 0 1 2
}

// continue - skips current iteration
for (let i = 0; i < 5; i++) {
  if (i === 2) continue;
  console.log(i); // 0 1 3 4
}
```

---

## for...of vs for...in

|                | `for...of`            | `for...in` |
| -------------- | --------------------- | ---------- |
| Works on       | Arrays, strings, sets | Objects    |
| Gives          | Value                 | Key        |
| Use on arrays? | Yes                   | Avoid      |

---

## Interview Questions

**Q1. What is the difference between for...of and for...in?**

> `for...of` iterates over values of arrays or strings.
> `for...in` iterates over keys of an object.
> You should avoid using `for...in` on arrays because it can also loop inherited properties.

---

**Q2. What is the difference between while and do...while?**

> `while` checks the condition first. If false from the start, the code never runs.
> `do...while` runs the code once first, then checks the condition.

---

**Q3. Can you use break inside forEach?**

> No. `break` does not work inside `forEach`. If you need to stop early, use a regular `for` loop or `for...of`.

---

**Q4. When would you use a while loop instead of a for loop?**

> When you do not know how many times the loop should run.
> For example, reading user input until they type "exit", or waiting for a condition to change.

---

**Q5. What is an infinite loop? How do you avoid it?**

> A loop that never stops because the condition never becomes false.
> Example: `while (true) {}` — always avoid forgetting to update the counter or condition.

---

## Quick Revision

- `for` — fixed count iterations
- `while` — condition checked before running
- `do...while` — runs at least once, condition checked after
- `for...of` — values from arrays/strings
- `for...in` — keys from objects
- `forEach` — array method, no `break` support
- `break` — exit loop early
- `continue` — skip current step, go to next
