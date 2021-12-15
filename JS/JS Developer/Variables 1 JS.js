{
    let department = 'Sales';

    var pageSize = 100;

    const pi = 3.14;
}


 var fontFamily;

 var fontSize;

const fontKing= 'King';

let role;
let visits;

if(typeof role == 'undefined') 
{
    role = 'Guest';
}

if(visits == null) 
{
    visits = 1
}

let user =
{
    mode: role,
    numVisits: visits,
    timestamp: (new Date()).getTime()
};

var name = 'Astro'
function printName() 
{
    changeName();
    console.log('Current charcter is: ' + name);    
}

function changeName() 
{
    name = 'Codey';
}

printName();

function printNames () 
{
    console.log('Current charcter is: ' + fname)
}

printNames();

var fname;

let amount = 1233.4456;

console.log(amount.toFixed(2));

let str = '50';

var animal = 
{
    type: 'dog',
    sound: function () { console.log('Woof!'); }
}

animal.sound();

var animal = new Object();
animal.type = `dog`;
animal.sound = function() 
{
    console.log(`Woof!`);
}

var brands = ["Fender", "Bender", "Fox", "Line6"];

var brands2 = new Array("Fender", "Bender", "Fox", "Line6");

const record = [
    "opportunity",
     12345,
     ["PXL-1345", "XMP-648", "VQE- 0672"], 
     Date.now];

     record[0] = "changed";

     if(typeof role == 'undefined') {
         role = 'Major';
     }

     console.log(record);

     console.log(Array.from('123'));
     console.log(Array.of("een", "twee", "drie"));
     console.log(Array.isArray(["I am", "an", "Array"]));

     let quizScores = new Map();
     quizScores.set('quiz1', [12, 14, 15]);
     quizScores.set('quiz2', [34, 65, 34, 23]);
     quizScores.set('quiz3', [3,5]);
     console.log(quizScores);

     const str2 = new String('This is a string constructor'); 

     function greeting(greet, name)
     {
         let punct = '.';
         if(greet.toLowerCase().includes('good morning')) 
         {
             punct = '!';
         }
         return greet.concat(' ', name, punct);
     }

     console.log(greeting('Welcome and Good Morning', 'James'));

     const str3 = 'Welcome';
     const str4 = 'Good Morning';
     const greeting1 = str3 + ' and ' + str4;
     console.log(greeting1);

     function message1 (issue, numSamples) 
     {
         let intro = 'Pause before proceeding:';
         let timePerSample = 30;
         return `${intro} ${issue} Wait ${timePerSample * 5} seconds.`;
     }

console.log(message1('The samples are not ready.', 5));

const num1 = 3.14;

const num2 = new Number(44.34);

function stringToNum(str) 
{
    if(Number.isNaN(str)) 
    {
        throw 'String cannot be converted';
    }
    if(Number.isInteger(str)) return Number.parseInt(str); return Number.parseFloat(str);
}

console.log(stringToNum('5.65.abcdse'));



const start = new Date();

console.log(start - new Date(Date.UTC(2000, 0, 0, 0, 0, 0)));
//check how long script takes to run with  this code
console.log(Date.now() - Date.parse(start));

function dateFormat(date) 
{
    return `${date.getDate()}-${date.getMonth() +1}-${date.getFullYear()}`;
}

console.log(dateFormat(start));

let d = new Date();

console.log(d.toString());

console.log(d.toDateString());

console.log(d.toUTCString());

console.log(d.toISOString());