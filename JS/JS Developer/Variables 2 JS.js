
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