Opdracht 1
SELECT Name, (SELECT Name FROM Contacts) FROM Account

Opdracht 2
SELECT Name, Account.name FROM Contact

Opdracht 3
SELECT Name FROM Contact ORDER BY Name DESC 

Opdracht 4
SELECT COUNT(Loan_Amount__c), Name FROM Contact WHERE Loan_Amount__c > 1000 GROUP BY Name

Opdracht 5
SELECT StageName, COUNT(Account.Name) FROM Opportunity GROUP BY StageName

Opdracht 6
SELECT Name FROM Opportunity WHERE Id = '0060900000Amu9QAAR'

Opdracht 7
SELECT Name, CreatedDate FROM Account WHERE CreatedDate < LAST_MONTH

Opdracht 8
SELECT (SELECT Name from Contacts), CreatedDate FROM Account ORDER BY CreatedDate ASC

Opdracht 9
SELECT Name, CreatedDate FROM Account WHERE CreatedDate = LAST_N_DAYS:30

Opdracht 10
SELECT Name FROM Contact WHERE Name IN('Sarah Smith', 'Jessi Jones')

Opdracht 11/12
SELECT Name FROM Account ORDER BY Name ASC LIMIT 10 OFFSET 4

OPDRACHT 13
SELECT Name FROM Contact WHERE Name LIKE '%s%'

Opdracht 14
SELECT StageName, MAX(Amount) FROM Opportunity GROUP BY StageName

Opdracht 15
SELECT Amount FROM Opportunity ORDER BY Amount DESC LIMIT 5 

Opdracht 16
SELECT SUM(Amount), MIN(Amount), MAX(Amount), AVG(Amount) FROM Opportunity

End.