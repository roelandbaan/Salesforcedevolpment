
// Create the account sObject
Account acc = new Account(Name = 'Acme', Phone = '1234-5555', NumberOfEmployees = 23);
// Insert the account by using DML
insert acc;

The following DML statements are available.

insert
update
upsert
delete
undelete
merge

The upsert DML operation creates new records and updates sObject records within a single statement,
using a specified field to determine the presence of existing objects,
or the ID field if no field is specified.

The merge statement merges up to three records of the same sObject type into one of the records,
deleting the others, and re-parenting any related records.

Account acc = new Account(Name = 'Acme', Phone = '1234-5555', NumberOfEmployees = 23);
insert acc;
// Get the new ID on the inserted sObject argument
ID accId = acc.Id;
System.debug('Account ID: ' + accId);


// Create a list of contacts
List<Contact> conList = new List<Contact> {
    new Contact(FirstName = 'Pietje', LastName = 'Jan', Department = 'Finance'),
    new Contact(FirstName = 'GekkePietje', LastName = 'GekkeJan', Department = 'Technology'),
    new Contact(FirstName='Caroline',LastName='Roth',Department='Finance'),
    new Contact(FirstName = 'Kim', LastName = 'Shain', Department = 'Education')};


// Bulk insert all contacts with one DML call
insert conList;

// List to hold the new contacts to update
list<Contact> listToUpdate = new list<Contact>();
// Iterate through the list and add a title only
//   if the department is Finance
for(Contact con : conList) {
    if(con.Department == 'Finance'){
        con.Title = '$$$';
        listToUpdate.add(con);
    }
}
    update listToUpdate;