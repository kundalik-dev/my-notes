// Swap two numbers :- Using two varriables only and Add, subtractions
const swapTwoNumsWithAddSub = (a, b) => {
  console.log(`Before swaping a is ${a}, b is ${b}`);
  a = a + b;
  b = a - b;
  a = a - b;
  console.log(`After swaping a is ${a} and b is ${b}`);
};

// Swap two numbers :- Using two varriables only with Mul and Div
const swapTwoNumsWithMulDIv = (a, b) => {
  console.log(`Before swaping a is ${a}, b is ${b}`);
  a = a * b;
  b = a / b;
  a = a / b;
  console.log(`After swaping a is ${a}, b is ${b}`);
};

const swapTwoNumsWithSingleStatment = (a, b) => {
  console.log(`Before swaping a is ${a}, b is ${b}`);
  b = a + b - (a = b);
  console.log(`After swaping a is ${a}, b is ${b}`);
};
// Swap with Addition & Subtraction
// swapTwoNumsWithAddSub(10, 20);
// swapTwoNumsWithAddSub(0, 20);
// swapTwoNumsWithAddSub(10, 0);

// Swap with Mul and div
// swapTwoNumsWithMulDIv(30, 40);
// swapTwoNumsWithMulDIv(30, 0);
// swapTwoNumsWithMulDIv(0, 40);
// swapTwoNumsWithMulDIv(-10, 40);

// Swap two numbers in single statment
swapTwoNumsWithSingleStatment(10, 20);

/* 
## Rules for swaping
- For mul and div swap one num should not be 0
*/
