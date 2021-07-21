SELECT Id, Name, CloseDate, Amount FROM Opportunity WHERE Amount > 5000 ORDER BY Amount DESC LIMIT 5

SELECT Id, Name, CloseDate, Amount FROM Opportunity WHERE Name = 'United Oil Refinery Generators' ORDER BY Amount DESC LIMIT 5

SELECT Id, Name, CloseDate, Amount FROM Opportunity WHERE Name LIKE 'United%'