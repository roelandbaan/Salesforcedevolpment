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

// index.js
// import {printFUnc as printStuff, convertFunc as convertStuff} from './utilities.js'



// utilities.js
function saveFunc()
{
    // save logic
}

function openFUnc()
{
    // open stuff
}

export {saveFunc as saveFile, openFunc as open};

// parent-module.js
export {save as saveFile, open as openFile} from './utilities.js'

// index.js
// import {saveFile, openFile} from '../modules/parent-module.js';



// dynamic importing

import('./modules/helper.js').then((module) => {
    // access the exports via the module object
    // module.saveFunc
});



let file = 'myFile'; 
 
const btn = document.getElementById("btn-convert");
let blob;
btn.addEventListener("click", loadModule);

function loadModule()
{
    import("../modules/utilities.js").then((module) => {
        blob = module.convert(file);
    })
}

// lib.js
export {add, subtract} from './modules/calculation.js';
export {printFile, convertFile} from './modules/fileHandling.js';

function loadModulePrint()
{
    import('../module/lib.js').then((module) => {
        module.printFile(file);
    })

    let module = await import('../module/lib.js')
    module.printFile;
}

