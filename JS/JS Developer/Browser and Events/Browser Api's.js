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