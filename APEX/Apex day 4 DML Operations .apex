//Insert an opportunity with apex
Opportunity opp = new Opportunity(
   Name = 'New Opportunity Apex day 4',
   CloseDate = Date.today(),
   Amount = 1000,
   StageName = 'Prospecting',
   AccountId = '0010900000XUlDrAAL' //Use an existing account ID ! (DôH)
);
insert opp;



//Update the amount on queried Opportunity
Opportunity opp = [SELECT Id FROM Opportunity WHERE Name = 'New Opportunity Apex day 4'];
opp.Amount = 5000;
Update opp;



//Delete Queried Opportunity
Opportunity opp = [SELECT Id FROM Opportunity WHERE Name = 'New Opportunity Apex day 4'];
delete opp;



//Atomicity wont allow this DML operation to run because the opp2 Opportunity is missing a required field
Opportunity opp1 = new Opportunity(
   Name = 'New Opportunity1 Apex day 4',
   CloseDate = Date.today(),
   Amount = 1000,
   StageName = 'Prospecting',
   AccountId = '0010900000XUlDrAAL' 
);

Opportunity opp2 = new Opportunity(
   Name = 'New Opportunity2 Apex day 4',
   CloseDate = Date.today(),
   Amount = 1000,
   AccountId = '0010900000XUlDrAAL' 
);

list<Opportunity> lstOpp = new List<Opportunity> {opp1, opp2};
    insert lstOpp;



//With A Database.insert command we can turn off atomicity and let the Operation finish and skip over records that produce errors
//Also made a debug log to dislay the erorrs
Opportunity opp1 = new Opportunity(
   Name = 'New Opportunity1 Apex day 4',
   CloseDate = Date.today(),
   Amount = 1000,
   StageName = 'Prospecting',
   AccountId = '0010900000XUlDrAAL' 
);

Opportunity opp2 = new Opportunity(
   Name = 'New Opportunity2 Apex day 4',
   CloseDate = Date.today(),
   Amount = 1000,
   AccountId = '0010900000XUlDrAAL' 
);

List<Opportunity> lstOpp = new List<Opportunity> { opp1, opp2 };
Database.SaveResult[] srList = Database.insert(lstOpp, false);

for (Database.SaveResult sr : srList )  {
    if (sr.isSuccess()) {
        // Operation was successful, so get the ID of the record that was processed
        System.debug('Successfully inserted account. Account ID: ' + sr.getId());
    }
    else {
        // Operation failed, so get all errors                
        for(Database.Error err : sr.getErrors()) {
            System.debug('The following error has occurred.');                    
            System.debug(err.getStatusCode() + ': ' + err.getMessage());
            System.debug('Account fields that affected this error: ' + err.getFields());
        }
    }
}



//I cant seem to get this Database.insert to work the error is in the isSucces() function but i cant determine why
//Fixed! wrote Sucess as Succes ALWAYS TRIPLE CHECK YOUR SPELLING WHEN HITTING AN ERROR!
Opportunity opp1 = new Opportunity(
   Name = 'New Opportunity1 Apex day 4',
   CloseDate = Date.today(),
   Amount = 1000,
   StageName = 'Prospecting',
   AccountId = '0010900000XUlDrAAL' 
);

Opportunity opp2 = new Opportunity(
   Name = 'New Opportunity2 Apex day 4',
   CloseDate = Date.today(),
   Amount = 1000,
   AccountId = '0010900000XUlDrAAL' 
);

List<Opportunity> lstOpp = new List<Opportunity> { opp1, opp2 };
Database.SaveResult[] srList = Database.insert(lstOpp, false);

for (Database.SaveResult sr : srList ) {
    System.debug(sr.isSuccess());
}



//TRANSACTION CONTROL
//This code is run where there is a validation rule active which wont allow new contacts to be created for the purpose of exploring Transaction control.
//When running the code u will get an error exception caused by the validation rule. in the debug log u will be able to query for the account and find it,
//but when your code hits an error the whole transaction will be rolled back and the account will not be created.
Account acc = new Account(
    Name = 'Test Account 1'
);
insert acc;

Account accQuery= [SELECT Id FROM Account WHERE Name = 'Test Account 1'];
System.debug('---' + accQuery);

Contact con = new Contact (
    LastName = 'Contact'
);
insert con;



// Applying a system savepoint(Line 124) after account creation but before contact creation(which will trigger the validation rule)
//With the try catch method we can have the databse rollback to our previously created savepoint (which is after account creation)
//So the account creation wont be rolled back.
Account acc = new Account(
    Name = 'Test Account 1'
);
insert acc;

Account accQuery= [SELECT Id FROM Account WHERE Name = 'Test Account 1'];
System.debug('---' + accQuery);

System.Savepoint spt = Database.setSavepoint(); 

try {
Contact con = new Contact (
    LastName = 'Contact'
);
insert con;
} catch (Exception ex) {
    Database.rollback(spt);
}