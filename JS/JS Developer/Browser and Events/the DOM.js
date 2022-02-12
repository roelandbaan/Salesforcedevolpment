function setVariables()
{
    let maxVisitors = 1000;
    window.minVisitors = 10;
}

let [userId, timestamp] = [15, 18646749];
let state = { id: userId, ts: timestamp };
console.log(state);
let url = '?id=' + userId + '&ts=' + timestamp;
console.log(url);

window.history.pushState(state, '', url);

setVariables();
console.log('this === window: ', this === window);
console.log('minVisitors: ', minVisitors);
console.log('this.minVisitors: ', this.minVisitors);
//console.log('maxVisitors: ', maxVisitors);


const msg = document.getElementById('message');
msg.innerHTML = '<span>Good Morning!</span>';

// The following properties and attributes are available in te DOM element

console.log(msg.tagName);
console.log(msg.innerHTML);
console.log(msg.classList);

// retrieve the value of the specified attribue
console.log(msg.getAttribute('id'));
// retrieve the size and position relative to the viewport
console.log(msg.getBoundingClientRect());


const msg1 = document.querySelector('#message');
msg1.innerHTML = '<h1>Good Morning</h1>';

const paragraphs = document.querySelectorAll('p');
for(let elem of paragraphs) {
    elem.style.color = 'red';
}