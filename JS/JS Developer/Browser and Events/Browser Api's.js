// dom api
let counter = 0;

const onClick = (event) => {
    const value = document.getElementById('value');
    value.innerHTML = counter++;
}


// fetch api (uses an Asynchromous pattern so it returns a promise)
const request = async () => {
    try{
        const url = 'https://jsonplaceholder.typicode.com/users/7';
    // invoke the fetch() method using the specified url and the 'GET' method.
        const response = await fetch(url, {method: "GET"});
    // use the json() method to get the parsed data from the response.
        const data = await response.json();
        let string = '';
    // iterate over all the keys in the data using a for... in loop.
        for(key in data){
            string += `${key} => ${JSON.stringify(data[key])}<br/>`;
        }
        document.getElementById('data').innerHTML = string;
    } catch (error) {
        document.getElementById('data').innerHTML = error;
    }
}

request();

// geolocation API

let locationElement = document.getElementById('location');
const options = {               // These are options to be passed to the the getCurrentPosition() method
    enableHighAccuracy: true,   // Enable high accuracy
    timeout: 5000,              // Amount of time before the error callback is invoked
    maximumAge: 0               // maximum cached position age in milliseconds
}

const handleSucces = (position) => {
    const result = position.coords;     // Save the coordinates of the location
    let message = 'You are at :<br/>' +
    `Latitude : ${result.latitude}<br/>` +
    `Longitude : ${result.longitude}<br/>` +
    `+/- ${result.accuracy} meters.`;
    locationElement.innerHTML = message;
}

const handleError = (error) => {
    console.warn(`ERROR ${error.code}: ${error.message}`);
}

const getLocation = () => {
    if(navigator.geolocation){
        navigator.geolocation.getCurrentPosition(handleSucces, handleError, options);
    } else {
        locationElement.innerHTML = 'Sorry, this browser doesnt support Geolocation';
    }
}

// history API
window.onpopstate = function(event){
    document.getElementById('message').innerHTML = `You are here: ${document.location}, state: ${JSON.stringify(event.state)}`;
}

const backward = () => {
    history.back();
}
const forward = () => {
    history.forward();
}

// Replace the top page of the history stack with this page by calling the replaceState() method of the history object.
const replace = () => {
    history.replaceState(
        {page: 3}       // a JS object that represents the state of a page
        , "Page 3"      // the page title
        , "?page=3")    // the page url which replaces the top of the history stack
}

// Push a page to the history stack with by calling the pushSTate() method of the history object
const push = (state, title, url) => {
    history.pushState(
        state,      // a JS object that represents the state of a page
        title,      // the page title
        url);      // the page url that is added to the history stack
}


// Canvas API
const canvas = document.getElementById('myCanvas'); // get the canvas element
let ctx = canvas.getContext('2d');                  // get the canvas drawing context
ctx.strokeStyle = 'green';                          // set the color
ctx.lineWidth = 10;                                  // set the line width
ctx.strokeRect(10, 10, 150, 100);                   // Render a green rectangle
ctx.strokeStyle = 'blue';                          // set the color
ctx.lineWidth = 5;                                  // set the line width
ctx.strokeRect(50, 100, 50, 150);                   // Render a blue rectangle at a different postion
ctx.strokeStyle = 'red';                          // set the color
ctx.lineWidth = 15;                                  // set the line width
ctx.strokeRect(120, 50, 150, 200);                   // Render a red rectangle at a different postion


// url API

const urlString = 'http://example.com:3000/path/page?name=Adam&age=31#profile';
const urlObject = new URL(urlString);                   // Create a URL object from the URL string
const wholeURL = new URLSearchParams(urlString);        // Create a URLSearchParams object from the whole URL sring
const searchURL = new URLSearchParams(urlObject.search);// Create a URLSearchParams object from the query string
