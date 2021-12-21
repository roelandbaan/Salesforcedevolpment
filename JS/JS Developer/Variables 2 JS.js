
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

let copyInvoiceIds = invoiceIds.slice(2, 3);

console.log(copyInvoiceIds);
