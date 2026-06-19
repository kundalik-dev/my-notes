// Reverse the Number

function reverseNum(a) {
  console.log(`Before reversing number is ${a}`);

  let rev = 0;

  while (a != 0) {
    rev = rev * 10 + (a % 10);
    a = Math.floor(a / 10);
  }

  console.log(`After reversing number is ${rev}`);
}

// reverseNum(1234);

// Reverse num 02:-  complext logic with array and string methods
const reverseNum2 = (a) => {
  const newArr = [];

  for (const num of String(a)) {
    newArr.push(num);
  }

  const rev = String(newArr.reverse()).replaceAll(",", "");
  console.log(`reversed num is ${rev}`);
};

reverseNum2(4568);

// Reverse num 03:-  complext logic with array and string methods
const reverseNum3 = (a) => {
  const rev = String(a).split("").reverse().join("");
  console.log(`reversed num is ${rev}`);
};

reverseNum3(4568);

let myName = "Kundalik Jadhav";

const reversedName = myName.split("").reverse().join("");
console.log(`Reversed name is ${reversedName}`);

let name = "javaScript";
console.log("name split gives", name.split(""));
