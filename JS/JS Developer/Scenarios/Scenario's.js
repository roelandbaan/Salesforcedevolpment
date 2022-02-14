//  scenario variables
let numEmployees = 0;
const maxEmployees = 50;
let name = '';
let salary = null;
let address = {number: null, street: null, city: null, state: null,  zip: null, country: 'United States'};
let active;
let retrieved = false;


// scenario strings numbers and dates
const startDate = new Date();

function elpsedTime(sDate)
{
    const minuteDivisor = 1000 * 60;
    const secondDivisor = 1000;
    let eMSecs = Date.parse(new Date()) - Date.parse(sDate);
    let minutes = Math.floor(eMSecs/minuteDivisor);
    let secondsLeft = eMSecs - (minutes * minuteDivisor);
}

// scenario type coercion and effects
function processScore(obj, passScore)
{
    if(String(obj.score) > -1) {
        if(obj.score > passScore){
            obj.pass = true;
        } else{
            obj.pass = false;
        }
    }
};

// scenario data manipulation with arrays
let customers = [    
    { id: 432, name: "Gwen", rating: 4.9, bonus: 20 },
    { id: 112, name: "Jack", rating: 4.5, bonus: 40 },    
    { id: 226, name: "Sam", rating: 4.0, bonus: 0 },    
    { id: 102, name: "Sofia", rating: 3.9, bonus: 50 },    
    { id: 324, name: "Marven", rating: 3.2, bonus: 0 }
];

let customersWithScore = customers.map((customer) =>{
    let score = customer.rating * 2.4 + customer.bonus;
    return{...customer, score: score.toFixed(2)}
});

let sortedCustomersWithScore = customersWithScore.sort((a,b) => a.score - b.score);

sortedCustomersWithScore.splice(3,2);

let sortedCustomerNames = sortedCustomersWithScore.map((customer) =>  customer.name);

sortedCustomerNames.join(", ");

console.log(sortedCustomerNames);


// scenario how to operate the JSON object

const xhr = new XMLHttpRequest();
// const url = 'http://salesforce.com';

// xhr.open('GET', url);
// xhr.send();

xhr.onreadystatechange = () => {
    if(xhr.readyState === XMLHttpRequest.DONE){
        const jsObject = JSON.parse(xhr.responseText);
        generateHTML(jsObject);
    }
};


// 2
// const url = 'http://cosmicuniversity.com/students/' + studentName;
// fetch(url, {method: 'GET'}).then((response)=>{
//     return response.json();
// }).then((data)=>{
//     for(let prop in data){
//         console.log(prop, '=>', data[prop]);
//     }
// }).catch((error) => {
//     console.log(error);
// });

// 3
const record = { id: 'HR-1005-T', name: 'Jill Smith', title: 'HR Manager', salary: 75000 };
const url = 'http://portal.cosmicinnovation.com/employees';
fetch(url, {method:'POST',
            headres: {
                'content-Type': 'application/json'
            }, body: JSON.stringify(record)
        }).then(response => response.json()).then(data => {
            console.log('Succes', data);
        }).catch((error) => {
            console.log('Error', error);
});


// Objects functions and classes

// function implementation

(function (){
    const time = document.getElementById('elepsedTime');
    const btn = document.getElementById('button');
    const startTime = new Date();

    const getSeconds = ()=> Math.floor((new Date() - startTime)/1000);
})();

// btn.addEventListener('click', ()=>{
//     time.innerHTML = `A total of ${getSeconds()} seconds used.`;
// });

// object implementation
let meetingRoom = {
    canReserve: true,
    capacity: 30,
    open: true,
    reservable(prop){
       return this.prop;
    },
    set available(value){
        this.open = value;
    },
    get available(){
        if(this.canReserve && this.open){
            return true;
        } return false;
    }
}

const boardRoom = Object.assign({}, meetingRoom);
boardRoom.capacity =20;

// class implementation

class Course 
{
    constructor(title, timeRequired){
        this.title = title;
        this.timeRequired = timeRequired;
        this.topicList = [];
    }
    get topic(){
        return this.topicList;
    }
    addTopics(topic){
        this.topicList.push(topic);
    }
}

class OrientationCourse extends Course
{
    constructor(title, timeRequired){
        super(title, timeRequired);
        this.isRequired = true;
    }
};

const myClass = class {

}

// Js Modules

// export {add , subtract} from './calculation.js';
// export {printFile, convertFile} from './fileHandling.js';

const btn = document.getElementById('btn');
//btn.addEventListener('click', loadModulePrint);
function loadModulePrint(){
    import('./modules/lib.js').then((module)=> {module.printFile(file)});
}

// using await
// let module = await import('./modules/lib.js');
// module.printFile(file);


// using the decorator
function errorHandler(...args)
{
    let fn;
    if(args[2]){
        var [, , descriptor] = args;
        fn = descriptor.value;
    }else {
        [fn] = args;
    }
    let returnFunction = function(){
        try {
            fn();
        } catch(error){
            console.log(error.message);
        }
    }
    if(descriptor){
        descriptor.value = returnFunction;
        return descriptor;
    }
    return returnFunction;
}

console.log(new Number(''));