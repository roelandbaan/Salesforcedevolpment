function sum(num1, num2) {
    return num1 + num2;
};

let result = sum(20,30);

console.log(result);

const arr = [20, 30, sum];

let result1 = arr[2](arr[1], arr[0]);
console.log(result1);

function fib(num1, num2) {
    let num3 = function(){
    return num1 + num2;
    }();
    return [num1, num2, num3];
}

const arr1 = fib(1,2);

console.log(arr1);

const greeting = function(name) {
    let greet = `Welcome to the course ${name}!`;
    let greetDiv = document.getElementById('greet');
    setTimeout(function() {
        greetDiv.innerHTML = greet;
    }, 1000)
}

greeting('Roel');


const sum1 = function(num1, num2) {
    return num1 + num2;
}
const arrowSum1 = (num1, num2) => num1 + num2;

const greeting1 = function(name) {
    console.log(`Good Morning ${name}!`);
}

const arrowGreet1 = name => console.log(`Good Morning ${name}!`);

const random10 = function() {
    return Math.floor(Math.random() * 10) +1;
}
const arrowRandom10 = () => Math.floor(Math.random() * 10) +1;


const nums = [1, 2, 3, 4, 5];
const newNums = nums.map(num => num * 2 );
console.log(newNums);


const createMultiplyFunction = function(num) {
    console.log(num);
    return num1 => num1  * num;
}

const multiplyBy10 = createMultiplyFunction(10)
console.log(multiplyBy10(5));


let date;
let intro;
const start = document.getElementById('start');
const showDate = function () {
    console.log(`${intro} ${date}`);
}

start.addEventListener('click', showDate);

date = new Date();
intro = "Today's date is";
console.log('Program is running!');

function createScoreFunction() {
    scores = [];
    return function(score) {
        scores.push(score);
        console.log(`Total scores: ${scores.lenght}`);
    }
};

const addScore = createScoreFunction();
