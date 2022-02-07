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

function fib1(sequence, len) {
    let size = sequence.length;
    if(size >= len) {
        return sequence;
    }
    sequence.push(sequence[size - 2] + sequence[size - 1])
    return fib1(sequence, len); //calls itself with the return keyword
}
const fibSeq = fib1([0, 1], 10);
console.log('Recursive function fib1: ' + fibSeq);

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

console.log(createMultiplyFunction(10)(5));

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

addScore(70);
addScore(90);
addScore(100);

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


function* rhymeGenerator(){
    yield 'One, two, three, four, five,';
    yield 'Once I caught a fish alive,';
    yield 'Six, seven, eight, nine, ten,';
    yield 'Then I let it go again.';
}

const myGenerator = rhymeGenerator();

console.log(myGenerator.next().value);
console.log(myGenerator.next().value);
console.log(myGenerator.next().value);
console.log(myGenerator.next().value);
console.log(myGenerator.next().value);

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
console.log(fib100.next());
console.log(fib100.next());
console.log(fib100.next());
console.log(fib100.next());
console.log(fib100.next());
console.log(fib100.next());
console.log(fib100.next());
console.log(fib100.next());
console.log(fib100.next());


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
console.log(factorial10.next())


// const time = document.getElementById('elapsedTime');
// const btn = document.getElementById('btnTime');
// const startTime = new Date();

// const getSeconds = ()=>{
//     Math.floor((new Date() - startTime) / 1000);
// }

// btn.addEventListener('click', function() {
//     time.innerHTML = `A total of ${getSeconds()} seconds used.`;
// })



// Object inititalizer or Object Literal
let userr1 = {
    name: 'ikke',
    age: 25,
    admin: true,
    created: new Date(),
    greeting(greet) {
        console.log(`${greet} ${this.name} ${this.age}!`);
    }
};

// Object constructor
let userr2 = new Object();
userr2.name = 'Sam';
userr2.age = 35;
userr2.admin = false;
userr2.created = new Date();

// Object.create() method
let userr3 = Object.create({});
userr3.name = 'Isabel';
userr3.age = 46;
userr3.admin = false;
userr3.created = new Date();

console.log(userr2.name);
console.log(userr2['name']);

delete userr2.age;
console.log(userr2);

for(let prop in userr1) {
    console.log(prop, userr1[prop])
}

console.log(Object.keys(userr2));

console.log(Object.getOwnPropertyNames(userr2));

userr1.greeting('Good Morning');

// define a getter in an Object
let scores1 = {quiz: 'quiz1', scores:[90, 70, 60, 50, 40, 100, 60],
                get average(){
                    if(this.scores.length === 0 ) return 0;
                    return this.scores.reduce((sum, score) => sum + score, 0 ) / this.scores.length;
                }
            } ;

console.log(scores1.average);            

// define a setter in an Object

let scores2 = {
    quiz: 'quiz2',
    scores: [],
    set score(score) {
        if (score >= 0) this.scores.push(score);
    }
};

scores2.score = 90;
scores2.score = 80;
console.log(scores2.scores);

// primitive variable passed by value
function passPrimitive(name) {
    name = 'Jerry';
}
let person = 'Tom';
passPrimitive(person);
console.log(`Hi my name is ${person}`);

// Object variable passed by reference
function passObject(settings){
    settings.on = true;
}
let config = { device: 'microwave', on: false};
passObject(config);
console.log(config);


// This example function sums parameters passed to it and uses
// the arguments object to retrieve the parameters
function add() {
    let sum = 0;
    for(let i in arguments) {
        sum += arguments[i]; // the arguments object is array like
        
    }
    console.log(`The sum of the ${arguments.length} numbers is ${sum}`);
}

add(62, 34, 45, 93);


// In this example, 'Object.assign()' is used inside the 
// 'cloneObject' function in order to clone any object passed in.
function cloneObject(obj){
    return Object.assign({}, obj);
};

// This example illustrates the 'scores' object was cloned 
// and is an entirely different object.
let scores3 = {
    quiz: 'quiz3',
    scores: [90, 70, 60, 50, 40, 100, 60]
};

let newScores = cloneObject(scores3);
newScores.scores = [];
console.log(scores3, newScores);

/* In this example function, the 'hasOwnProperty' method is used so the function 
only returns the property value if it is owned bythe object. */

function reservable(obj){
    if(obj.hasOwnProperty('canReserve')) {
        return obj.canReserve;
    } else {
        return false;
    }
};

let meetingRoom = {
    canReserve: true,
    capacity: 20
};
console.log(reservable(meetingRoom));

// freeze method
const user4 = {
    role: 'guest'
};
Object.freeze(user4);
user4.role = 'admin';
console.log(user4);

// example using the preventExtensions methods
// const user5 = { role: 'guest'};
// Object.preventExtensions(user5);
// try{
//     Object.defineProperty(user5, 'age', {value: 25});
// } catch(e) {
//     console.log(e);
// }

// example using the seal method
const user6 = { role: 'guest'};
Object.seal(user6);
user6.role = 'member';
delete user6.role;  //unable to delete when sealed
console.log(user6);


/* This example shows how to define an object named 'boardRoom'
that inherits the properties and methods of another object named'meetingRooms'. */
let meetingrooms1 = {
    reservable() {
        if(this.hasOwnProperty('canReserve')) {
            return this.canReserve;
        } else {
            return false;
        }
    },
    loaction: 'mainBuilding'
};

let boardRoom1 = Object.create(meetingrooms1);
boardRoom1.canReserve = true;
boardRoom1.capacity = 20;
boardRoom1.loaction = 'satellite' // Creates own 'location' property on 'boardRoom'
console.log(boardRoom1.reservable());


// In this example, a “hello” method is added to the Animal prototype 
// and then modified to illustrate how it impacts instances ofthe object.
function Animal1(name) {
    this.name = name;
}
let cat = new Animal1('kitty');
let dog = new Animal1('puppy');

Animal1.prototype.hello = function () {
    console.log(`Hi, my name is ${this.name}.`);
}
cat.hello();
dog.hello();
cat.sound = function() { console.log('Meooow');}
dog.sound = function() {console.log('Woof');}

Animal1.prototype.hello = function (){
    console.log(`${this.name}'s the name. What's yours?`);
}
cat.hello(); dog.hello(); cat.sound(); dog.sound();
// In this example, a Set is created from an array 
// so that only unique values are included. A new value is also added.
let decades = [1990, 1990, 2000, 2010, 1990, 2000, 2020];
let uniqueDecades = new Set(decades);
uniqueDecades.add(1980);

console.log(uniqueDecades);

// In this example, a map is used, instead of an object, for recording quiz scores
// since the data can be easier to work with.
let quizScores = new Map();
quizScores.set('quiz1', [100, 90, 80, 95, 60]);
quizScores.set('quiz2', [75, 85, 90, 80, 55]);
quizScores.set('quiz3', [65, 60, 45, 75, 50]);

console.log(quizScores.values());

let meetingroomX = {
    canReserve: true,
    capacity: 30,
    open: true,
    reservable(prop) {
      return this.prop;
    },
    get available() {
        if(this.canReserve && this.open) {
            return true;
        }
    },
    set available(val){
        this.open = val;
    }
}

let boardRoomX = Object.assign({}, meetingroomX);
boardRoomX.capacity = 20;

console.log(boardRoomX);

// The basic syntax of a class declaration is as follows:
class ClassName {
    constructor() {}; // the constructor is optional
    method1(){};
    method2(){};
}

// The basic syntax of a class expression is as follows:
// A class expression can be anonymous or named.
// The name is only visible in the scope of the class expression.
let ClassName1 = class OptionalName{
    constructor() {};
    method2(){};
    method1(){};
}

class MeetingroomC
{
    constructor(available)
    {
        if(available) {
            this.reservable = true;
        }
    } 
};

let boardRoomC = new MeetingroomC(true);
console.log(boardRoomC);

class User
{
    constructor(user, email)
    {
        this.user = user;
        this.email = email;
    }
};

let user7 = new User('team lead', 'blabla@here.com');
console.log(user7);


class User1
{
    constructor(fName, lName)
    {
        this.firstName = fName;
        this.lastName = lName;
    }

    fullName() 
    {
        return this.firstName + ' ' + this.lastName;
    }
};

let userT = new User1('Sarah', 'James');
console.log(userT);

class meetingRoomB
{
    constructor(capacity)
    {
        this.capacity = capacity;
        this.canReserve = false;
    }
    
    set reservable(val)
    {
        this.canReserve = val;
    }

    get reservable()
    {
        return this.canReserve;
    }

}

let boardRoomB = new meetingRoomB(20);
boardRoomB.reservable = true;
console.log(boardRoomB.reservable);


class User33
{
    constructor(fName, lName)
    {
        this.firstName = fName;
        this.lastName = lName;
    }

    fullName() 
    {
        return this.firstName + ' ' + this.lastName;
    }

    static isUser(obj)
    {
        return obj instanceof User33;
    }
};

let user9 = new User33('Michael', 'Chin');
console.log(User33.isUser(user9));

class Users
{
    constructor(user, email)
    {
        this.user = user;
        this.email = email;
    }

    isUser()
    {
        return true;
    }
}

class Employees extends Users
{
    constructor(user, email, id)
    {
        super(user, email);
        this.employeesId = id;
    }

    isEmployee()
    {
        return true;
    }
}

let employee1 = new Employees('roel', 'hello@gmail.com', '223B');
console.log(employee1);
console.log(employee1.isUser());
console.log(employee1.isEmployee());

let employee2 = new Employees('roel', 'hello@gmail.com', 354);
console.log(employee2);


class Course
{
    constructor(title, timeRequired)
    {
        this.topicList = [];
        this.title = title;
        this.timeRequired = timeRequired;
    }

    get topics() {
        return this.topicList
    }

    addTopics(topic)
    {
        this.topicList.push(topic);
    }
}

class OrientationCourse extends Course
{
    constructor(title, timeRequired,isRequired){
    super(title, timeRequired)
    this.isRequired = true;
    }
};

function changeStuff(a, b, c)
{
  a = a * 10;
  b.item = "changed";
  c = {item: "changed"};
  console.log('this is b\'s value => ', b, ' and c =>', c);
}

var num = 10;
var obj1 = {item: "unchanged"};
var obj2 = {item: "unchanged"};

changeStuff(num, obj1, obj2);

console.log(num);
console.log(obj1.item);
console.log(obj2.item);


function displayName(name)
{
    console.log(name);
}

function displayNameDecorator(fn)
{
    return function(name)
    {
        const str = 'Welcome to the hotel '+ name + '!';
        fn(str);
    };
}

const customerName = displayNameDecorator(displayName);
customerName('John Wayne');



function loggerDecorator(fn)
{
    return function(...args)
    {
        console.log("Started function " + fn.name);
        console.log(args);
        fn(...args);
    };
}

function getUser(userId, AuthKey)
{
    
}

let getUserFn = loggerDecorator(getUser);
getUserFn('AC102', 'iuygdfyg46');


var data;

function errorHandlerDecorator(fn)
{
    return function(...args)
    {
        try{
            console.log('Trying funcition '+ fn.name);
        } catch(err) {
            console.log(err);
        }
    }
}

function parse(str)
{
    let obj = JSON.parse(str);
    console.log(obj);
    return obj;
}

function getUser1()
{
    //data.user = localStorage.getItem('user');
}

let parseFn = errorHandlerDecorator(parse);
let getUser1Fn = errorHandlerDecorator(getUser1);
getUser1Fn();
parseFn("/{}");


// decorator functions don't work for classes and class methods as shown below
function log(fn)
{
    return function()
    {
        console.log('Execution of ' + fn.name);
        console.time('fn');
        let val = fn();
        console.timeEnd('fn');
        return val;
    }
}

let test1 = log(getUser1);
test1();


class User10
{
    constructor(name, age)
    {
        this.name = name;
        this.age = age;
    }
    getUser2()
    {
        return `[${this.name}][${this.age}]`;
    }
}


let obj3 = new User10('Piet de Vries', 32);
//let getUser3 = log(obj3.getUser2);


// this console log causes an error 'fn is undefined'
// console.log(getUser3());
// When the ‘getUser’ method is called, it returns an anonymous function which is returned by the log decorator.
// The value of ‘this’ inside an anonymous function refers to the global object, not the user object,
// which is why the TypeError occurs, see the fix below

function log1(obj, fn)
{
    return function()
    {
        console.log('Execution of ' + fn.name);
        console.time('fn');
        // invoke function with object's context
        let val = fn.call(obj);
        console.timeEnd('fn');
        return val;
    }
}

class User11
{
    constructor(name, age)
    {
        this.name = name;
        this.age = age;
    }
    getUser2()
    {
        return `[${this.name}][${this.age}]`;
    }
}

let obj4 = new User11('Piet de Vries', 32);
let getUser2 = log1(obj4, obj4.getUser2);
console.log(getUser2());


// Using the decorater syntax @decoraterfunctionname
function logPropertyDecorator(...args)
{

}

class Student
{
    constructor(name, grade)
    {
        this.name = name;
        this.grade = grade;
    }

// decorated class method    
    // @logPropertyDecorator
    // getStudent()
    // {
    //     return `[Name=${this.name}][grade=${this.grade}]`;
    // }
}


function methodLogger(target, name, descriptor)
{
    console.log(`[Class=${target.constructor.name}] [Method=${name}]`);
    descriptor.value = (nameVal) => {
        console.log(`${name} function started`);
        return fn(nameVal);
    };
    return descriptor;
}

class Human
{
    constructor(name)
    {
        this.name = name;
    }

    //@methodLogger
    save(name)
    {
        localStorage.setItem('name', name);
        return 'Successfull';
    }
}
let human = new Human('Hendrik Groen');
console.log(human.save());



function generateDecorator(target)
{
    console.log(`${target.name} Class Constructor Modified`);
    return function(date, type, value)
    {
            this.date = date;
            this.type = type;
            this.value = value;
            this.id = getRandomId();
    }
}

//@generateDecorator
class Transaction
{
    constructor(date, type, value)
    {
        this.date = date;
        this.type = type;
        this.value = value;
    }
}

let transaction1 = new Transaction(new Date(), 'Internal', 50000);
console.log(`[Transaction1][ID=${transaction1.id}]`);

let transaction2 = new Transaction(new Date(), "External", 200000);
console.log(`[transaction2][ID=${transaction2.id}]`);

class Delivery
{
    constructor(id, date, destination)
    {
        this.id = id;
        this.date = date;
        this.destination = destination;
    }
}

let delivery = new Delivery("LX2361",new Date(),"DXB");

let descriptors = Object.getOwnPropertyDescriptor(delivery, 'destination');

console.log(descriptors);



function readOnlyDecorator(target, name, descriptor)
{
    console.log(`[Class=${target.constructor.name}][Method=${name}]`);
    descriptor.writable = false;
    return descriptor;
}

class Product
{
    constructor(id, name)
    {
        this.id = id;
        this.name = name;
    }

    //@readOnlyDecorator
    getProduct()
    {
        return `[ID=${this.id}][Name=${this.name}]`;
    }
}

let product = new Product("YK232", "Apples");
console.log(product.getProduct());

product.getProduct = () => {};
console.log(product.getProduct());

class Ticket
{
    constructor(id, date, customerName, origin, destination)
    {

    }

    createPDF()
    {

    }

}

function printFileFn(file)
{

}


function errorHandler(...args)
{
    let fn;
    if(args[2]) {
        var[, , descriptor] = args;
        fn = descriptor.value;
    } else {
        [fn] = args;
    }
    let returnFunction = function()
    {
        try
        {
            fn();
        }catch (error){
            console.log(errror.message);
        }
    }
    if(descriptor)
    {
        descriptor.value = returnFunction;
        return descriptor;
    }
    return returnFunction;
}