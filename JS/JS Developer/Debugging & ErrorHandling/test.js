// async function abc(){
//     let promise = new Promise((resolve,reject)=>{
//         setTimeout(() => resolve('hello'), 1000)
//     })
//     console.log('start2');
//     let greeting = await promise;
//     console.log('end');
// }
// abc().then(data => console.log(data));

// const http = require('http');
// const server = http.creareServer(function(request, response){
//     response.writeHead(200, {"ContentType":"text/plain"});
//     response.end("Hello world \n");
// });

// server.listen(8080);

// var http = require('http');
// const server = http.createServer(function(request, response){
//     response.write('hello sf devs');
//     response.end();
// });
// server.listen(8080, function(){
//     console.log('Listening on port 8080');
// })

// const event = require('event');
// const eventEmitter = new event.EventEmitter();

// const myEventHandler = function(e){
//     console.log('event riggered: ', e)
// }

// eventEmitter.on('greet', myEventHandler);

// eventEmitter.emit('greet');

let myElement = document.querySelector('h1');
myElement.setAttribute('variant', 'succes');
myElement.style.display = 'none';
console.log(myElement);

const myArray = [0,1,2,3,4];
myArray[10] = 9;
console.log(myArray);
console.log(myArray[6]);

myElement.classList.remove('jaja');
myElement.style.color = 'red';
myElement.style.display = 'block';

// function onButtonClick(e){
//     console.log('clicked', e);
// }

// console.log(myElement.classList);
const myButton = document.querySelector('button'); 
// myButton.addEventListener('click', onButtonClick, false);
// myButton.onclick = function(e){
//     console.log('click',e);
// }

// myButton.removeEventListener('click', onButtonClick, false);
// window.addEventListener('DOMContentLoaded', ()=>{
//     console.log('DOMContent has loaded!');
// });


myButton.addEventListener('click', (e) =>{
    const myEvent = new CustomEvent('display text', { detail: "de details"});
    myButton.dispatchEvent(myEvent)
})

myElement.addEventListener('display text', (e)=>{
    console.log(e.detail);
    myElement.innerText = e.detail;
});

localStorage.setItem('keyString', 'valueString');
let str = localStorage.getItem('keyString');
console.log(str);
localStorage.removeItem('keyString');
let str2 = localStorage.getItem('keyString');
console.log(str2);

var num = 10;

const increaseNumber = () => num++;
const increasePassedNumber = number => number++;

const num1 = increaseNumber();
const num2 = increasePassedNumber(num1);

console.log(num1);
console.log(num2);

[1, 2, 3, 4].reduce((x, y) => console.log(x, y));

let check = new Number('3');
console.log(typeof check);

let ewArray = [1,2,3,4,5,6];
ewArray.splice(2,0, 9);
console.log(ewArray);

function hiya (...stuff){
    console.log(stuff);
}

hiya(['hi', 4 , 'yo']);