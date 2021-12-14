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