

// Create the account sObject
Account acc = new Account(Name = 'Acme', Phone = '1234-5555', NumberOfEmployees = 23);
// Insert the account by using DML
insert acc;



// The following DML statements are available.

insert
update
upsert
delete
undelete
merge

// The upsert DML operation creates new records and updates sObject records within a single statement,
using a specified field to determine the presence of existing objects,
or the ID field if no field is specified.

// The merge statement merges up to three records of the same sObject type into one of the records,
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



//Upsert Syntax

upsert sObject | sObject[]

upsert sObject | sObject[]​​ field

// Insert the Josh contact
Contact josh = new Contact(FirstName = 'Josh', LastName = 'Kaplan', Department = 'Finance');
insert josh;

// Josh's record has been inserted
//   so the variable josh has now an ID
//   which will be used to match the records by upsert
josh.Description = 'Josh\'s record has been updated by the upsurt operation.';
// Create the Kathy contact, but don't persist it in the database
Contact kathy = new Contact(FirstName = 'Kathy', LastName = 'Brown', Department = 'Technology');
// List to hold the new contacts to upsert
List<Contact> contacts = new List<Contact> { josh, kathy };
// Call upsert
upsert contacts;
// Result: Josh is updated and Kathy is created.



Contact jane = new Contact(FirstName = 'Jane', LastName = 'Smith',
 Email = 'jane.smith@example.com', Description = 'Contact of the Day');
insert jane;
// 1. Upsert using an idLookup field
// Create a second sObject variable.
// This variable doesn’t have any ID set.
Contact jane2 = new Contact(FirstName= 'Jane', LastName= 'Smith', 
Email = 'jane.smith@example.com', Description = 'Prefers to be contacted by email');
// Upsert the contact by using the idLookup field for matching.
upsert jane2 Contact.fields.Email;
// Verify that the contact has been updated
System.assertEquals('Prefers to be contacted by email',
 [SELECT Description FROM Contact WHERE Id = :jane.Id].Description);


Contact[] contactsDel = [SELECT Id FROM Contact WHERE LastName = 'Smith'];
delete contactsDel;



try{
     // This causes an exception because 
    //   the required Name field is not provided.
    Account acc = new Account();
    insert acc;
} catch (DmlException e) {
        System.debug('A DML exception has occured: ' + e.getMessage());
}


// Apex contains the built-in Database class, which provides methods that perform DML operations and mirror the DML statement counterparts.
// These Database methods are static and are called on the class name.

Database.insert()
Database.update()
Database.upsert()
Database.delete()
Database.undelete()
Database.merge()


// This is how you call the insert method with the allOrNone set to false.

Database.insert(recordList, false);

// The Database methods return result objects containing success or failure information for each record.
// For example, insert and update operations each return an array of Database.SaveResult objects.

Database.SaveResult[] results = Database.insert(recordList, false);

// Upsert returns Database.UpsertResult objects, and delete returns Database.DeleteResult objects.

// By default, the allOrNone parameter is true, which means that the Database method behaves like its DML statement counterpart and will throw an exception if a failure is encountered.
// The following two statements are equivalent to the insert recordList; statement.
Database.insert(recordList);

And:

Database.insert(recordList, true);


// Create a list of contacts
List<Contact> conList = new List <Contact> {
    new Contact(FirstName='Joe',LastName='Smith',Department='Finance'),
        new Contact(FirstName='Kathy',LastName='Smith',Department='Technology'),
        new Contact(FirstName='Caroline',LastName='Roth',Department='Finance'),
        new Contact()};

// Bulk insert all contacts with one DML call
Database.SaveResult[] srList = Database.insert(conlist, false);

// Iterate through each returned result
for(Database.SaveResult sr : srList) {
    if(sr.isSuccess()) {
// Operation was successful, so get the ID of the record that was processed        
    System.debug('Successfully inserted contact. Contact ID =' + sr.getId());
    } else {
// Operation failed, so get all errors        
    for (Database.Error err : sr.getErrors()) {
        System.debug('The following error has occured');
        System.debug(err.getStatusCode() + ': '+ err.getMessage());
        System.debug('Contact fields that affected this error: '+ err.getFields());
    }    
    }
}

//WHY NOT WRITE   ELSE IF(!sr.isSuccess) INSTEAD OF MAKING ANOTHER FOR LOOP??????


Account acc = new Account(Name = 'SFDC Account');
insert acc;
// Once the account is inserted, the sObject will be 
// populated with an ID.
// Get this ID.
ID accId = acc.Id;
// Add a contact to this account.
Contact con = new Contact(FirstName = 'Mario', LastName = 'Ruiz',
 Phone = '1234-5678', AccountId = accId);
 insert con;



 // Query for the contact, which has been associated with an account.
 Contact queriedCon = [SELECT Account.Name FROM Contact WHERE AccountId != null
  AND LastName = 'Ruiz' LIMIT 1];
 // Update the contact's phone number
 queriedCon.Phone = '9876-5432';
 // Update the related account industry
 queriedCon.Account.Industry = 'Technology';
 // Make two separate calls 
// 1. This call is to update the contact's phone.
update queriedCon;
// 2. This call is to update the related account's Industry field.
update queriedCon.Account;
 


Account[] queriedAcc = [SELECT Id FROM Account WHERE Name = 'SFDC Account'];
delete queriedAcc;


// assignment
public class AccountHandler {
    
    public static Account insertNewAccount(String AccName) {
        Account acc = new Account(Name = AccName);
        try{
        insert acc;
        }
        catch (DmlException e){
            return null;
        
    } return acc;
}
}

// Some SOQL Queries
SELECT Name,Phone FROM Account WHERE (Name='SFDC Computing' AND NumberOfEmployees>25)

SELECT Name,Phone FROM Account WHERE (Name='SFDC Computing' OR (NumberOfEmployees>25 AND BillingCity='Los Angeles'))

// You can combine the optional clauses in one query, in the following order:
SELECT Name, Phone FROM Account
                   WHERE (Name = 'SFDC Computing' AND NumberOfEmployees > 25)
                   ORDER BY Name
                   LIMIT 10 

Account[] accts = [SELECT Name, Phone FROM Account 
WHERE (Name = 'SFDC Computing' AND NumberOfEmployees > 25) ORDER BY Name LIMIT 10];
System.debug(accts.size() + 'account(s) returned.');
// Write all account array info
System.debug(accts);


// Accessing Variables in SOQL Queries
// SOQL statements in Apex can reference Apex code variables and expressions if they are preceded by a colon (:).
// The use of a local variable within a SOQL statement is called a bind.

String targetDepartment = 'Wingo';
Contact[] techContacts = [SELECT FirstName, LastName FROM Contact WHERE Department =: targetDepartment]

//Querying Related Records
SELECT Name (SELECT LastName FROM Contacts) FROM Account WHERE Name = 'SFDC Computing'



Account[] acctsWithContacts = [SELECT Name, (SELECT FirstName, LastName FROM Contacts) 
FROM Account WHERE Name = 'SFDC Computing'];
// Get child records
Contact[] cts = acctsWithContacts[0].Contacts;
System.debug('Name of first associated contact: ' + cts[0].FirstName +', '+ cts[0].LastName);


// Wanted to try to write this is a for loop but don't know how or if its possible.
Account[] acctsWithContacts = [SELECT Name, (SELECT FirstName, LastName FROM Contacts) 
FROM Account WHERE Name = 'SFDC Computing'];
// Get child records
for(Account cts : acctsWithContacts) {
    System.debug('Name of first associated contact: ' + cts.Contact.FirstName);
}


//Get the Assoiciated Account name(Parent) of a Contact(Child)
Contact[] cts = [SELECT Account.Name FROM Contact WHERE (FirstName = 'Carol' AND Lastname = 'Ruiz')];
Contact carol = cts[0];
String acctName = carol.Account.Name;
System.debug('Carol\'s account name = ' + acctName);



//SOQL for loops iterate over all of the sObject records returned by a SOQL query. The syntax of a SOQL for loop is either:
for (variable : [soql_query]) {
    code_block
}
or
for (variable_list : [soql_query]) {
    code_block
}



insert new Account[] {
    new Account(Name = 'for loop 1'),
    new Account(Name = 'for loop 2'),
    new Account(Name = 'for loop 3')
};
// The sObject list format executes the for loop once per returned batch
// of records
Integer i = 0;
Integer j = 0;
for(Account[] acc : [SELECT Id FROM Account WHERE Name LIKE 'for loop _']){
j = acc.size();
i++;
}
System.assertEquals(3, j); // The list should have contained the three accounts
System.assertEquals(1, i); // Since a single batch can hold up to 200 records and,
                           // only three records should have been returned, the 
                           // loop should have executed only once 

// Assignment SOQL
public class ContactSearch {
    
    public static List<Contact> searchForContacts(String lst, String postalCode) {
        try{
    List<Contact> cons = new List<Contact>();
        cons = [SELECT Id, LastName FROM Contact WHERE (LastName = :lst AND MailingPostalCode = :postalCode)];
        return cons;
    } catch (DmlException e){
        System.debug('An error occurred'+ e.getMessage());
        return null;
    }
    }
}
