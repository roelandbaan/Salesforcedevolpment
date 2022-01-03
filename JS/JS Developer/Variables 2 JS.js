
const account = null;
const contact = {};

if(account) {
    console.log('process account..(imtruthy)');
} else {
    console.error('Nobueno(falsy)');
}

if (contact) 
{
    console.log('process contact (im truthy)');
} else 
{
    console.error('cant(im falsy');
}

function registerUser(user) 
{
    if(!Boolean(user.email) || !Boolean(user.fullName)) 
    {
        console.error("Name or email cant be empty");
    }else {
        if(Boolean(user.interests)) console.log("Curate articles about: " + user.interests.join(", ") + ".");

        if(Boolean(user.birthdate)) console.log("Calculate age of registrant: " + user.birthdate);

        if(Boolean(user.subscribe)) console.log("Send monthly newsletters to: " + user.email + ".");

        if(Boolean(user.photo)) console.log("Upload " + user.photo + " to file server.");
    }
}

registerUser({
    fullName: "Johhny Rad",
    interests: ["Cooking", "Hiking"],
    email: "jaja@emails.com",
    birthdate: null,
    subscribe: true,
    photo: undefined
});


function registerUser1(user) 
{
    if(!!!Boolean(user.email) || !!!Boolean(user.fullName)) 
    {
        console.error("Name or email cant be empty");
    }else {
        if(!!Boolean(user.interests)) console.log("Curate articles about: " + user.interests.join(", ") + ".");

        if(!!Boolean(user.birthdate)) console.log("Calculate age of registrant: " + user.birthdate);

        if(!!Boolean(user.subscribe)) console.log("Send monthly newsletters to: " + user.email + ".");

        if(!!Boolean(user.photo)) console.log("Upload " + user.photo + " to file server.");
    }
}

registerUser1({
    fullName: "Karin Jones",
    interests: ["Cooking", "dancing", "Hiking"],
    email: "ja22ja@emails.com",
    birthdate: Date.parse("1929/11/09"),
    subscribe: false,
    photo: "mary.png"
});

const minPaperCount = 25;

function getPrinterStatus(printer) 
{
    let isAddPaper = printer.paperCount < minPaperCount;
    let statusPaper = isAddPaper ? "Add more paper" : "No need to add paper";
    let statusInk = printer.inkLevel ? "No need to replace the ink cartrigde" : "Replace ink cartridge";

    console.log("Printer name: " + printer.name);
    console.log(statusPaper);
    console.log(statusInk);
}

getPrinterStatus({name: 'inkjet TS7654', paperCount: 30, inkLevel: 2 });
getPrinterStatus({name: 'inkjet OY7654', paperCount: 10, inkLevel: 0 });

const product = ['array-887', 'entries-444', 'for999', 'testing77'];

const product1 = new Array('gimme-33', 'some-098', 'entries-998');


const priceList = [24, 65, 78, 94, 340];

for(let i = 0; i < priceList.length; ++i) 
{
    console.log(priceList[i]);
}

const customers = new Array('Henk de Vries', 'Piet de Wild', 'Marie Klaassen', 'Trouwe Klant');

for(const index in customers) 
{
    console.log(customers[index])
}

for(const index1 of customers) 
{
    console.log(index1);
}

const shipmentDates = [new Date('2021-07-01'), new Date('2021-04-15'), new Date('2021-12-10')];

shipmentDates.forEach(date => 
    {
        const formattedDate = `${date.getMonth()+1}/${date.getDate()}/${date.getFullYear()}`;
        console.log(formattedDate);
    })

let customerNames = new Array('Naam eerst', 'Tweede persoon', 'nummer drie', 'naam laatst');

console.log(customerNames);

customerNames.splice(2, 0, 'Extra na 2', 'ik ook');

console.log(customerNames);

customerNames.splice(2, 4);

console.log(customerNames);


let invoiceIds = ['A001', 'N239', 'B887', 'T650'];

console.log(invoiceIds);

let copyInvoiceIds = invoiceIds.slice(1, 3);

console.log(copyInvoiceIds);


let licenses = ['I-492P', 'N-579K', 'V-2555', 'I-492P', 'P-551R'];

console.log("License J-342A => " + licenses.includes('J-342A'));

console.log("License I-492P => " + licenses.includes('I-492P'));

console.log("Index of I-492P = " + licenses.indexOf('I-492P'));

console.log("Last Index of I-492P = " + licenses.lastIndexOf('I-492P'));

let fruits = [
{ name: 'Apple', qty: 40 },
{ name: 'Orange', qty: 20 },
{ name: 'Banana', qty: 5 },
{ name: 'Tomato', qty: 9 },
{ name: 'Mango', qty: 30 }
];

let productToReorder = fruits.find((element, index, array) => element.qty < 10);
let productToReorder2 = fruits.findIndex((element, index, array) => element.qty < 10);

console.log(productToReorder);
console.log(productToReorder2);

let phones = ["Apple Iphone 7", "Samsung Galaxy S9", "Google Pixel 5", "OnePlus 8T"];

console.log(phones.join(" | "));

let studentMarks = [
    { Studentname: "John", mark: 45 },
    { Studentname: "Bill", mark: 20 },
    { Studentname: "Kate", mark: 78 },
    { Studentname: "Alice", mark: 94 }
];

let sortedStudents = studentMarks.sort((a, b) => b.mark - a.mark);

console.log(sortedStudents);


let students = ["Kate", "Lucy","Sheldon", "Barry","Zara"];

let studentsArray = students.map((value, index, array) => {
    return {
        id: index,
        name:value
    };
});

console.log(studentsArray);



let maleSprinters = [ 
    { name: "Usain Bolt", time: 9.58 },
    { name: "Tyson Gay", time: 9.69 },
    { name: "Yohan Blake", time: 9.69 },
    { name: "Asafa Powell", time: 9.72 },
    { name: "Justin Gatlin", time: 9.76 }
];

let totalTime = maleSprinters.reduce((acc, value) => acc + value.time, 0);

console.log(totalTime);

const sales_users = new Array('John Smith', 'Linwood France', 'Dave Hines');

const employees = ['Hariett Parks', ...sales_users, 'Aurelia Haney', 'Joanne Browing', 'Nicole Novak'];

console.log(employees);


function displaySalesUsers(...sales_users2) 
{
    console.log(sales_users2);
}


displaySalesUsers('Array elements', 'Names Usually', 'Next Entry?');

let customers2 = [    { id: 432, name: "Gwen", rating: 4.9, bonus: 20 },
    { id: 112, name: "Jack", rating: 4.5, bonus: 40 },
    { id: 226, name: "Sam", rating: 4.0, bonus: 0 },
    { id: 102, name: "Sofia", rating: 3.9, bonus: 50 },
    { id: 324, name: "Marven", rating: 3.2, bonus: 0 }
];

let customersWithScore = customers2.map((customer) => {
    let score = customer.rating * 2.4 + customer.bonus;
    return { 
        ...customer, score: score.toFixed(2)
    }
});

let sortedCustomersWithScore = customersWithScore.sort((a,b) => a.score - b.score );

sortedCustomersWithScore.splice(3, 2);

let sortedCustomerNames = sortedCustomersWithScore.map((customer) => customer.name);

console.log(sortedCustomerNames.join(", "));




const jsonString = '{"job": {"title": "manager", "salary": 1000000. "location": "NY", "telecomuting": true}}';

const jsObject = {
    song: {
        title: 'Together We\'re Friends',
        artist: 'Blue Jays Choir',
        length: 3.55,
        genre: 'Country'
    }
};

const jsonString1 = JSON.stringify(jsObject);
console.log(jsonString1);


const jsonString2 = '{ "profile": { "name": "Caryn Brown", "children": null, "age": 24, "smoker": false, "hobbies": ["biking", "hiking", "sailing"] }}';

const jsObject1 = JSON.parse(jsonString2);
console.log(jsObject1);



// Create a new XMLHttpRequest object and store it in a variab
const xhr = new XMLHttpRequest();
//store the path of the JSON resource in a variable
const url = 'http://webaddress/data.json';
// open the HTTP request by specifying the method and url
xhr.open('GET', url);
//send the HTTP request
xhr.send()

//handle the HTTP response
xhr.onreadystatechange = () => {
    //check if the HTTP request is done
    if(xhr.readystate === XMLHttpRequest.DONE) 
    {
        //Convert JSON data to a Javascript Object
        const jsObject = JSON.parse(xhr.responseText);
    }
};


const productJson = '{ "name": "White T-shirt", "price": 5.99, "inventory": [ { "size": "S", "quantity": 100 }, { "size": "M", "quantity": 150 }, { "size": "L", "quantity": 75 } ], "returnable": true, "brand": { "name": "Luxury", "origin": "Taiwan" }, "customization": null }';

const productJs = JSON.parse(productJson);

console.log('Product name => ', productJs.name);

console.log('Product Brand name => ', productJs.brand.name);

console.log(productJs.inventory[1].size, productJs.inventory[1].quantity);



console.log('for...in loop =>');

for(let item in productJs) 
{
    console.log(item, ' => ', productJs[item]);
}

//log key-value pairs using Object.entries()
console.log('Object.entries() ==> ');
console.log(Object.entries(productJs));



const jsonString3 = '{ "profile": { "name": "Caryn Brown", "children": null, "age": 24, "smoker": false, "hobbies": ["biking", "hiking", "sailing"] }}';

const jsobject5 = JSON.parse(jsonString3);
console.log(jsobject5);

// Create a new XMLHttpRequest object and store it in a variable
const xhr1 = new XMLHttpRequest();

// Store the path of the JSON resource in a variable
const url1 = 'http://awebsite/data.json';

// Use the responseType property to ensure that the response is in JSON format
xhr1.responseType = 'json';

// Open the HTTP Request by specifying the method and url
xhr1.open('Get', url);

xhr1.send();

xhr1.onreadystatechange = () => {
    if(xhr1.readystate === XMLHttpRequest.DONE) {
        const jsobject7 = JSON.parse(xhr1.responseText);
    }
};


const productJson99 = '{"name": "White T-shirt", "price": 55, "inventory": [{"size": "S", "quantity": 100}, {"size": "M", "quantity": 150}, {"size": "L", "quantity": 75}], "returnable": true, "brand": {"name": "Luxury", "origin": "Taiwan"}, "customization": null}';

const productJs99 = JSON.parse(productJson99);

// Log key-value pairs using for...in loop
console.log('for... in loop => ');

for(let item in productJs99) {
    console.log(item, ' => ', productJs99[item]);
}

// Log key-value pairs using Object.entries()
console.log('Object.entries() => ');
console.log(Object.entries(productJs99));

//scenario 1
const xhr3 = new XMLHttpRequest();
const url3 = 'http://cosmicsoftwaresolutions.com/employees';
xhr3.open('GET', url3);
xhr3.send();
xhr3.onreadystatechange = () => {
    if (xhr3.readyState === XMLHttpRequest.DONE) {
      
    }
};

var studentName = 'Picollo'

fetch()
//scenario 2
const urlS2 = 'http://cosmicuniversity.com/students/' + studentName;

fetch(urlS2, {method: 'GET'}).then((response) => {
    return response.json()
}).then((data) => {
    console.log(Object.entries(data));
    for(let item in data) {
    console.log(item, ' => ', data[item]);
    }
}).catch((error) => {
    console.log(error);
})


//scenario 3
const records3 = { id: 'HR-1005-T', name: 'Jill Smith', title: 'HR Manager', salary: 75000 };

const urls3 = 'http://portal.cosmicinnovation.com/employees';

fetch(urls3, {method: 'POST', headers: {
    'content-Type': 'application/json'},
body: JSON.stringify(records3)
}).then(response => response.json()
).then(data => {
    console.log('Succes:', data);
}).catch((error) => {
    console.log('Error => ', error);
})