const loginEvent = new CustomEvent('login', {
    detail: {
        validUser: true
    }
});

document.dispatchEvent(loginEvent);

function loginUser()
{
    console.log('Logging in...');
}

const loginButton = document.getElementById('login-button');
loginButton.addEventListener('click', function clicky(event){
    loginUser(event);
});

loginButton.addEventListener('mouseover', function(event){
    event.target.style.color = 'green';
});

loginButton.addEventListener('mouseleave', function(event){
    event.target.style.color = 'red';
})

function onClickItem(event)
{
    let text = event.target.textContent;
    console.log(`Mouse coordinates: ${event.clientX}, ${event.clientY}`);
    console.log(`Captured text: ${text}`);
}
document.querySelector('ol').addEventListener('click', onClickItem)

function checkPassword()
{
    let pass = document.getElementById('pass').value;
    let user = document.getElementById('user').value;
    console.log(user, pass);
};

// function checkPassword()
 
// {let pass = document.getElementById('pass').value;
// let user = document.getElementById('user').value;
// console.log(user, pass);};

document.getElementById('pass').onchange = function(event)
{
    let pass = document.getElementById('pass').value;
    let user = document.getElementById('user').value;
    console.log(user, pass);
}

document.getElementById('outerF').addEventListener('click', function(e){
    console.log('Click event received by outer div.');
}, false);

document.getElementById('middleF').addEventListener('click', function(e){
    console.log('Click event received by middle div.');
}, false);

document.getElementById('innerF').addEventListener('click', function(e){
    console.log('Click event received by inner div.');
}, false);



document.getElementById('outerT').addEventListener('click', function(e){
    console.log('Click event received by outer div.');
}, true);

document.getElementById('middleT').addEventListener('click', function(e){
    console.log('Click event received by middle div.');
}, true);

document.getElementById('innerT').addEventListener('click', function(e){
    console.log('Click event received by inner div.');
}, true);



document.getElementById('outerS').addEventListener('click', function(e){
    console.log('Click event received by outer div.');
});

document.getElementById('middleS').addEventListener('click', function(e){
    console.log('Click event received by middle div.');
});

document.getElementById('innerS').addEventListener('click', function(e){
    e.stopPropagation();
    console.log('Click event received by inner div.');
});



document.getElementById('outerD').addEventListener('keypress', function(e){
    console.log('Outer Div received a keypress: ', e.key);
});

function checkName(e)
{
    let char = e.key;
    let charCode = e.charCode;
    let alphabet = 'abcdefghijklmnopqrstuvwxyz';
    // Prevent anything but letters from showing using preventDefault while allowing charCode 8 (backspace)
    // in case the user needs to delete a character.
    if(charCode !== 8 && !alphabet.includes(char.toLowerCase())) {
        e.preventDefault();
    }
}



// Scenario 1
const nameField = document.getElementById('name1');
nameField.addEventListener('keypress', checkName);

const finishBtn = document.getElementById('finish-quiz');

finishBtn.onclick = function(e){
    const evt = new CustomEvent('finishedQuiz', {
        quizComplete: true
    });
    window.dispatchEvent(evt);
}

window.addEventListener('finishedQuiz', function(e){
    console.log('Quiz has finished.');
});


// Scenario 2
document.addEventListener('DOMContentLoaded', function(e) {
    console.log('hi')
});


// Scenario 3
const benefitChoices = [];

document.getElementById('choices1').onclick = function(event){
    event.preventDefault();
    if (benefitChoices.length >= 3) {
    event.stopPropagation();
    } else {
    event.target.classList.add('red');
    }
};

document.getElementById('choices-div').onclick = function(e){
    benefitChoices.push(e.target.innerText);
    console.log(benefitChoices);
    }

const submit = document.getElementById('submit-choices');
submit.addEventListener('click', function(e){
    this.innerHTML = 'Submitted';
    this.disabled = true;
});

const timer  = function(){
    let start = Date.now();
    setTimeout(function(){
      let end = Date.now();
      console.log( "Duration: " + (end - start) )
    },1000);
  };