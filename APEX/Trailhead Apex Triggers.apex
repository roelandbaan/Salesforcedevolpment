
Trigger HelloWorldTrigger on Account (before insert) {
    System.debug('Hello World');
}

//There are two types of triggers.

// Before triggers are used to update or validate record values before they’re saved to the database.
// After triggers are used to access field values that are set by the system
// (such as a record's Id or LastModifiedDate field), and to affect changes in other records.
// The records that fire the after trigger are read-only.

// Trigger.New contains all the records that were inserted in insert or update triggers. 

// Trigger.Old provides the old version of sObjects before they were updated in update triggers,
// or a list of deleted sObjects in delete triggers.



trigger HelloWorld2 on Account (before insert) {
    // Iterate over each record that triggered (E.g. via Bulk insert through api(adding a list of accounts))
    for(Account a : Trigger.new) {
        a.Description = 'New Description';
    }
}

trigger contextExampleTrigger on Account (before insert, after insert, after delete) {
    if(trigger.isInsert) {
        if(trigger.isBefore){
        // Process before insert
        }
        else if (trigger.isAfter) {
        // Process after insert
        }
    } else if(trigger.isDelete) {
        // Process after delete
    } 
}


// isExecuting	Returns true if the current context for the Apex code is a trigger, not a Visualforce page, a Web service, or an executeanonymous() API call.
// isInsert	Returns true if this trigger was fired due to an insert operation, from the Salesforce user interface, Apex, or the API.
// isUpdate	Returns true if this trigger was fired due to an update operation, from the Salesforce user interface, Apex, or the API.
// isDelete	Returns true if this trigger was fired due to a delete operation, from the Salesforce user interface, Apex, or the API.
// isBefore	Returns true if this trigger was fired before any record was saved.
// isAfter	Returns true if this trigger was fired after all records were saved.
// isUndelete	Returns true if this trigger was fired after a record is recovered from the Recycle Bin. This recovery can occur after an undelete operation from the Salesforce user interface, Apex, or the API.

// new	Returns a list of the new versions of the sObject records.
//      This sObject list is only available in insert, update, and undelete triggers, and the records can only be modified in before triggers.

// newMap	A map of IDs to the new versions of the sObject records.
// This map is only available in before update, after insert, after update, and after undelete triggers.

// old	Returns a list of the old versions of the sObject records.
//      This sObject list is only available in update and delete triggers.

// oldMap	A map of IDs to the old versions of the sObject records.
//      This map is only available in update and delete triggers.

// operationType	Returns an enum of type System.TriggerOperation corresponding to the current operation.
//      Possible values of the System.TriggerOperation enum are: BEFORE_INSERT, BEFORE_UPDATE, BEFORE_DELETE,AFTER_INSERT, AFTER_UPDATE, AFTER_DELETE, and AFTER_UNDELETE. If you vary your programming logic based on different trigger types, consider using the switch statement with different permutations of unique trigger execution enum states.

// size	The total number of records in a trigger invocation, both old and new.



// if-else better for boolean values: If-else conditional branches are great for variable conditions
// that result into a boolean, whereas switch statements are great for fixed data values.
// Speed: A switch statement might prove to be faster than ifs provided number of cases are good.



trigger AddRelatedRecord on Account (before insert, before update) {
    
    if(trigger.isInsert || trigger.isUpdate) {
        allAccMustHaveAnOpp.OppAdder();
        
    }

}

public class allAccMustHaveAnOpp {
    
    public static void OppAdder(object[] newTrigger) {
        
        List<Opportunity> oppList = new List<Opportunity>();
        
        // Get the related opportunities for the accounts
 Map<Id, Account> acctsWithOpps = new map<Id, Account>(
[SELECT Id, (SELECT Id FROM Opportunities) FROM Account WHERE Id IN :Trigger.NEW]);
        
        // Add an opportunity for each account if it doesn't already have one.
        // Iterate through each account.
        for(Account a : Trigger.New) {
            System.debug(acctsWithOpps.get(a.Id).Opportunities.size());
            // Check if the account already has a related opportunity.
            if(acctsWithOpps.get(a.Id).Opportunities.size() == 0) {
                
                
            }
        } 
    }

}