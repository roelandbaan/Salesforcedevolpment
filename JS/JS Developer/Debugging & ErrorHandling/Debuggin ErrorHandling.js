function recordProgress(progress)
{
    if (Array.isArray(progress)) {
        let strData = JSON.stringify(progress);
        try {
            SD.SetDataChunk(strData); // Try API method   
        } catch(e) {
            console.log('The Api Method is not available', e);
        } finally {
            storeLocalStorage(strData); // Always record data in localStorage

        }
    } else {
        console.log('else statement');
    }
};

document.querySelector('button').addEventListener('click', recordProgress);

// var http = require('http')
// var server = http.createServer(function(request,response){
//     response.write('Hello sf devs!')
//     response.end()
// })
// server.listen(8080, function(){
//     console.log('Listening on port 8080');
// })

setTimeout(function(){
    console.log('timer has finished');
}, 1000)


// const xhr = new XMLHttpRequest();
// xhr.open('GET', 'https://jsonplaceholder.typeicode.com/todos/1', true);
// xhr.onload = function(){
//     let todo = JSON.parse(xhr.responseText);
//     console.log(todo);
// };

// xhr.send(null);

// fetch('http://mjajayurl.com')
// .then(resp => resp.json())
// .then(todo => console.log(todo))
// .catch(err => console.log('problem fetching data: ', err));

function timer(time)
{
    return new Promise((resolve, reject) => {
        if(isNaN(time)) reject('Enter a Number');
        let secs = time*1000;
        setTimeout(function(){
            resolve(time);
        }, secs);
    });
};
timer(5).then(val=> console.log('done', val));

// fetch('https://swapi.dev/api/')
// .then(resp => resp.json)
// .then(urls => {
//     return fetch(urls.people)
//     .then(resp2 => resp2.json)
//     .then(data => console.log(data))
//     .catch(err => console.log(err))
// });

const promise1 = new Promise((resolve, reject)=> setTimeout(resolve, 1000, 'Promise one'));
const promise2 = new Promise((resolve, reject)=> setTimeout(resolve, 2000, 'Promise two'));
const promise3 = new Promise((resolve, reject)=> setTimeout(resolve, 1500, 'Promise three'));
const promise4 = new Promise((resolve,reject) => setTimeout(reject, 500, 'Promise four error'));

Promise.all([promise1, promise2, promise3])
.then((valueArray)  => console.log('Promise.all',valueArray));

Promise.race([promise1, promise2, promise3, promise4])
.then(arrayValue => console.log('Promise.race',arrayValue));

Promise.any([promise1, promise2, promise3, promise4])
.then(valueArray => console.log('Promise.any',valueArray));

// async function getTodo(id){
//     try{
//         let url = 'https://jsonplaceholder.typeicode.com/todos/1' + id;
//         let resp = await fetch(url);
//         let results = await resp.json();
//         console.log(results);
//     } catch(err){
//         console.error('Problem fetching data', err);
//     }
// };

// getTodo(5);
function loadData(callback){
let xhr = new XMLHttpRequest();
xhr.open('Get', 'https://api.github.com/orgs/nodejs');
xhr.onload = function(){
    callback(xhr.response);
    }
    xhr.send(null);
}

loadData(function(result){
    console.log(result);
})

setTimeout(function(a, b){
    console.log(a);
    console.log(b);
}, 5000, 'salsforce', 'hello');

console.log('this will display first');

//let completed = true;
function makeTaskPromise(completed){
return new Promise(function(resolve, reject){
    setTimeout(()=>{
        if(completed){
            resolve('task completed');
        } else {
            reject('taks is rejected');
        }
    }, 5000)
})
}
// .then(onFullfilled, onRejected) takes 2 parameters. onFullfilled and onRejected

let task1 = makeTaskPromise(false);
task1.then(success => console.log(success), failure => console.log(failure))
.catch(error => console.log('error handled by catch'));

async function abc(){
    return "hello"
}
abc().then(data => console.log(data));

