export function multiply(n)
{
    return n*2;
}

const num = 13;
let value = 13;

function multiplyN(n)
{
    return n*2;
}

// main.js
// import {multiplyN} from './modules/helper.js'

// helper.js
export {multiplyN, num, value};

export default class
{
    constructor()
    {

    }
}

// main js
// import {MultiplyN, num, value} from './modules.js'

// utilities.js
function print()
{
    // do stuff
}

function convert()
{
    // convert stuff
}

export {print, convert};

// import * as utilities from './utilities.js'

// utilities.print
// utilities.convert




// utilities.js
export {print as printFUnc, convert as convertFunc};

// import {printFUnc as printStuff, convertFunc as convertStuff} from './utilities.js'




