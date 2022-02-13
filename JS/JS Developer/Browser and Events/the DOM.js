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


const h1 = document.createElement('h1');
h1.innerHTML = 'Welcome to our site!';
document.body.insertBefore(h1, document.getElementById('content'));


const p = document.createElement('p');
p.innerHTML = 'We hope you learned a lot!';
document.getElementById('content').appendChild(p);


const ans = document.getElementById('answer');
const cols = ans.getAttribute('cols');
if(cols <= 20) {
    ans.setAttribute('cols', '30');
}


function createTable(rows, columns)
{
    const body = document.querySelector('body'), table = document.createElement('table'), tBody = document.createElement('tbody');
    let count = 0;
    function createCells(row)
    {
        for(let i = 0; i < columns; i++){
            const cell = document.createElement('td'); // create cells for row
            count++;
            cell.style = 'text-align:center;';
            cell.innerHTML = count;
            row.appendChild(cell); // add cell to row
        }
    ;}
    function createRows()
    {
        for(let i = 0; i <rows; i++){
            const row = document.createElement('tr'); // create row
            createCells(row);
            tBody.appendChild(row); // add row to table body
        }
    }
    createRows();
    table.appendChild(tBody); // add table body to the table
    body.appendChild(table); // add table to the document body
    table.setAttribute('border', '1');
    table.setAttribute('width', '300');
    table.setAttribute('height', '200');
}
createTable(4,3);


function showFeedback(id, correct)
{
    const correctFdbk = "Congratulations! That answer is correct.";
    const wrongFdbk = "I'm sorry, that answer is incorrect";
    const fdbk = document.createElement('div');
    if(correct)
    {
        fdbk.innerHTML = correctFdbk;
        fdbk.style.color = 'green';
    } else {
        fdbk.innerHTML = wrongFdbk;
        fdbk.style.color = 'red';
    }
    document.getElementById(id).appendChild(fdbk);
}

const allButtons = document.querySelectorAll('button');

for(let node of allButtons)
{
    node.addEventListener('click', checkAnswer);
}