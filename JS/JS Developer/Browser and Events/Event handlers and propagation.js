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
loginButton.addEventListener('click', function(event){
    loginUser(event);
});