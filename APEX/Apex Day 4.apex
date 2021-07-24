SELECT Id, Name, CloseDate, Amount FROM Opportunity WHERE Amount > 5000 ORDER BY Amount DESC LIMIT 5

SELECT Id, Name, CloseDate, Amount FROM Opportunity WHERE Name = 'United Oil Refinery Generators' ORDER BY Amount DESC LIMIT 5

SELECT Id, Name, CloseDate, Amount FROM Opportunity WHERE Name LIKE 'United%'

SELECT Id, Name, CloseDate, Amount FROM Opportunity WHERE Name LIKE '%Refinery%'


//This quesry does not work, i cant seem to get the API name of the account name via opportunity right
//FIXED!!! U HAVE to use dot notation Account.Name when looking up parent fields
SELECT Id, Name, CloseDate, Amount FROM Opportunity WHERE Account.Name IN ('Edge', 'GenePoint') 

// This example of IN does work
SELECT ID
     , Name
     , CloseDate
     , Amount
      FROM Opportunity
      WHERE StageName IN ('Closed Won','Qualification')

//NOT IN
      SELECT ID
     , Name
     , CloseDate
     , Amount
      FROM Opportunity
      WHERE StageName NOT IN ('Closed Won','Qualification')

//Using AND Logical Operator in queries
SELECT 
Id , 
Name, 
CloseDate, 
Amount 
FROM Opportunity 
WHERE Amount >= 50000 
AND CloseDate = LAST_YEAR      

//Using Aggregate Queries COUNT SUM etc.
SELECT COUNT(Id) FROM Opportunity
WHERE CloseDate = LAST_YEAR

//U can use Aggregate queries inside the HAVING operater u cant with WHERE and GROUP BY lets u get the result groupped by the specified field
SELECT Leadsource, COUNT(Name)
FROM Lead
GROUP BY LeadSource
HAVING COUNT(Name) > 1

SELECT StageName, COUNT(Id) FROM Opportunity WHERE CloseDate = LAST_YEAR GROUP BY StageName

SELECT StageName, COUNT(Id) FROM Opportunity WHERE CloseDate = LAST_YEAR GROUP BY StageName
HAVING COUNT(Id) = 1

//Using Child to parent Query (Opportunity to Account)
SELECT Name, Account.Name, Account.Type FROM Opportunity

//Using Parent to child query you must use the Child Relationship Name (Opportunities instead of Opportunity)
SELECT Name, (SELECT ID, Name, CloseDate FROM Opportunities)
      From Account

//runing query in apex. Make a list to store the query results and put the query in square brackets []
List<Opportunity> lstOpp = [SELECT Id, Name FROM Opportunity];
System.debug(lstOpp.size());

//Apex query looping over the results and displaying each result
List<Opportunity> lstOpp = [SELECT Name, Account.Name, Account.Type FROM Opportunity];
for (Opportunity opp : lstOpp) {
System.debug('oppName: '+ opp.Name);
 System.debug('AccNAme: ' + opp.Account.Name);   
}

//Running a Parent to child query in Apex (and looping over the results)
List<Account> lstAcc = [SELECT Name, (SELECT Id, Name, CloseDate FROM Opportunities)
      From Account WHERE Name = 'Dickenson plc']; 
for(Account acc : lstAcc) {
    System.debug('ACCName: ' + acc.Name);
for(Opportunity opp : acc.Opportunities) {
    System.debug('Opportunity: ' + opp.Name);
        }
}

//Example of a SOSL Query (Syntax)
List<List<SObjext>> searchList = [FIND 'Joe*' IN ALL FIELDS RETURNING Account(Id, Name), Lead];