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
    //console.log(num);
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

sumDeclaration(5, 10);
//sumExpression(50, 100);

const sumExpression = function(num1, num2) {
    console.log(num1 + num2);
}

sumExpression(50, 100);

function sumDeclaration(num1, num2) {
    console.log(num1 + num2);
}

function createScoreFunction() {
    scores = [];
    return function(score) {
        scores.push(score);
        console.log(`Total scores: ${scores.length}`);
    }
};

const addScore = createScoreFunction();


function createScoreFunction1() {
    scores = [];
    return function(score) { 
        scores.push(score);
        console.log(`Total scores: ${scores.length}`);
        }
       };
       
const addScore1 = createScoreFunction1();

let objGreet = {
    morningGreet(punct) {
        console.log(`Good morning ${this.firstName}${punct}`);
    },
    eveningGreet(punct) {
        console.log(`Good evening ${this.firstName}${punct}`);
    }
}

let user1 = {
    firstName: 'Mary'
};
let user2 = {
    firstName: 'Sam'
};

//call parameters are passed in as comma seperated list
objGreet.morningGreet.call(user1, '!');
//apply parameters are passed in as an array
objGreet.eveningGreet.apply(user2, ['?']);
// bind arguments returns a new function
objGreet.eveningGreet.bind(user1, '.')();

//generatorfuncion *
function* fibonacciSeq() {
    let start1 = 0, start2 = 1, cnt = 2;
    const sequence = [start1, start2];
    while(cnt <= 100) {
        let newNum = start1 + start2;
        start1 = start2;
        start2 = newNum;
        cnt++;
        sequence.push(newNum);
        yield sequence;
    }
};

const fib100 = fibonacciSeq();


//iterator function returns an iterator object
function progressiveFactoral(upperLimit) {
    let factorial = 1, num = 1;
    const factorialIterator = {//this is the iterator object
        next() { //the next method is required for the iterator object
            if(num <= upperLimit) {
                num++;
                factorial = factorial + num;
                return {value: {number: num, factorial},done: false}
            }
            return {value:{number: num, factorial}, done: true};
        }
    };
    return factorialIterator; // return the iterator object
}

let factorial10 = progressiveFactoral(10);