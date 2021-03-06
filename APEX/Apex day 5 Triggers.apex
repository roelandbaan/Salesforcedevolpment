//Example of a trigger syntax
trigger TriggerName on ObjectName (trigger_events) {
    			code_block
}

trigger myAccount on Account (before insert, before update) {
    			code_block	
}



//Examples of using Before/After update
trigger AccountTrigger on Account (before insert, before update, after update) {
			
    if(Trigger.isBefore && Trigger.isInsert) {
        System.debug('I am in before insert context');
    }
    if(Trigger.isUpdate) {
        if(Trigger.isBefore) {
        System.debug('I am in before update context');    
        }
        if(Trigger.isAfter) {
        System.debug('I am in After update context');
    }
  }
}



trigger AccountTrigger on Account (before insert, before update, after update) {
			
    if(Trigger.isBefore && Trigger.isInsert) {
        System.debug('I am in before insert context');
    }
    if(Trigger.isUpdate) {
        if(Trigger.isBefore) {
            for(Account acc : Trigger.new){
            System.debug('New Name' + acc.Name);
            System.debug('Old Name' + Trigger.oldMap.get(acc.Id).Name);
      }
    }
  }
}

//trigger on Account before insert

trigger AccountEmailer on Account (before insert) {
    
    if(trigger.isBefore && trigger.isInsert) {
        system.debug('I am in Account Before Insert context');
        
    }
}


// This Trigger checks if there is an email adress for the contact
// ERROR con.HasEmailAddress__c is a custom field that doesnt exist in my org.
//FIXED made a custom field of checkbox type
trigger ContactEmailchecker on Contact (before insert) {
        List<Contact> contactListToUpdate = new List<Contact>();
        for(Contact con : Trigger.new) {
            if(con.Email != null) {
                con.HasEmailAddress__c = true;
                contactListToUpdate.add(con);
            }
        }
    }


//This Trigger checks if HasEmailAdress field is true and if true calls the SendemailHelper class and sendEmail method
//ERROR HasEMailAdress custom field does not exist
//FIXED made a custom field of checkbox type
trigger ContactEmailSender on Contact (before insert) {
    
    List<Contact> contactEmailList = new List<Contact>();
    for(Contact con : Trigger.new) {
        if(con.HasEmailAdress__c) {
            contactEmailList.add(con);
        }
    }
    SendEmailHelper.sendEmail(contactEmailList);
}

//The order of excecution cannot be controlled so u cant make triggers depend on each other cause u cant controll which is processed first.



//Trigger to send an email before insert if email value is not NULL on Account creation (Insert)
trigger ContactTrigger on Contact (before insert) {
    
	List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
    for(Contact con : trigger.new) {
        if(con.Email != null) {
        Messaging.SingleEmailMessage singleMail = new Messaging.SingleEmailMessage();
        singleMail.setTargetObjectId(con.Id);
        singleMail.setHtmlBody('Hello');
        singleMail.setTreatTargetObjectAsRecipient(true);
        List<String> emailList = new List<String>();
        emailList.add(con.Email);
        singleMail.setToAddresses(emailList);
        emails.add(singleMail);
    }
  }
   Messaging.sendEmail(emails);
}






//Trigger Best Practices:

//This trigger will only grab the 1st record found
trigger MileageTrigger on Mileage__c (before insert, before update) {
    User c = [SELECT Id From User WHERE Mileageid__c = trigger.new[0].id];
}

// This Trigger loops over every found record and may run into governor limits (max 100 SOQL queries per instance)
trigger MileageTrigger on Mileage__c (before insert, before update) {
 for(Mileage__c m : Trigger.new) {
    User c = [SELECT Id From User WHERE Mileageid__c = m.Id];
 }


//Bulkify the query by first making a list of all the ids to search and then doing 1 soql query
 Trigger MileageTrigger Mileage__c (before insert, before update) {
     Set<ID> ids = Trigger.newMap.keySet();
     List<User> c = [SELECT Id FROM User WHERE Mileage__c in : ids];
 }


//Avoid RECUSRSION in triggers like in this example it excecutes an update command in the trigger and the trigger itself is set to after update.
 trigger Contact1 on Contact (after update) {

    List<Contact> contactListToUpdate = new List<Contact>();
    for(Contact con:Trigger.new) {
        if(con.Email != null) {
            con.hasEmailAdress__c = true;
            contactListToUpdate.add(con)
        }
    }
    update contactListToUpdate;
}


//this code helps check whether you are running recursions or not by checking if the new id is already added to the list SetOfIDs
public class CheckRecursive {
    public static Set<Id> SetOfIDs = new set<Id>();
}

trigger TestTrigger on Account (before insert) {
    if(trigger.isAfter && trigger.isInsert) {
        List<Account> accList = new List<Account>();
    for(Account test : Trigger.new) {
           if(!CheckRecursive.SetOfIDs.contains(test.Id)){
               test.Name = 'Hello World';
               accList.add(test);
             CheckRecursive.SetOfIDs.add(test.Id);  
            }
        }
        insert accList;
    }
}




//Use this code snippet to change from decimal to integer type
Decimal decimalValue = 12.0;
Integer integerValue = decimalValue.intValue();


//This is a trigger and a class to show u can call different methods depending on the different trigger stages

trigger AccTriggerHandler on Account (before insert, after insert, before update, after update) {

    AccountTriggerHandler handler = new AccountTriggerHandler(Trigger.isExecuting, Trigger.size);
    
    if(Trigger.isInsert) {
        if(Trigger.isBefore) {
            handler.OnbeforeInsert(trigger.new);
        }
        Else {
            handler.OnAfterInsert(trigger.new);
        }
    }
    Else if(Trigger.isUpdate) {
           if(Trigger.isBefore) {
             handler.OnBeforeUpdate(trigger.New, trigger.Old, trigger.NewMap, trigger.OldMap);
        }
        Else {
            handler.OnAfterUpdate(trigger.New, trigger.Old, trigger.NewMap, trigger.OldMap);
        }
    }
}






trigger AccTriggerHandler on Account (before insert, after insert, before update, after update) {

    AccountTriggerHandler handler = new AccountTriggerHandler(Trigger.isExecuting, Trigger.size);
    
    if(Trigger.isInsert) {
        if(Trigger.isBefore) {
            handler.OnbeforeInsert(trigger.new);
        }
        Else {
            handler.OnAfterInsert(trigger.new);
        }
    }
    Else if(Trigger.isUpdate) {
           if(Trigger.isBefore) {
             handler.OnBeforeUpdate(trigger.New, trigger.Old, trigger.NewMap, trigger.OldMap);
        }
        Else {
            handler.OnAfterUpdate(trigger.New, trigger.Old, trigger.NewMap, trigger.OldMap);
        }
    }
}




//Assignment day 5
Trigger LineItemsToInvoice on Invoice_Line_Item__c (after insert, after update) {


}

public class InvoiceMath {

   public static Decimal sumItems () {
       Decimal sumOfLineItems = 0;
       List<Decimal> listOfLineAmounts= new List<Decimal>();
        for(Invoice_Line_Item__c LItem : [SELECT Id, Price FROM Invoice_Line_Item__c WHERE ]) {
            //Select all the amounts and put them in a list need ids to know which parent record to update
            // to and which child records to query
            [SELECT Amount FROM Invoice_Line_Item__c];
            listOfLineAmounts.add(LItem.get.Amount);
            //sum over all Invoice_Line_Item__c Amount fields
           for(Integer i = 0; 1 <= listOfLineAmounts.size) {
               sumOfLineItems =  sumOfLineItems +listOfLineAmounts[i];
           }

        }update Invoice.Amount;
    }
}




// 2nd attempt
trigger UpdateTotalAmount on Invoice_Line_Item__c (after update, after insert) {
    
    InvoiceMath.sumLineItems();

}


public class InvoiceMath {
    
    public static void sumLineItems() {
        
        // Make  list that holds unique Invocie__c Ids
        Set<Id> lineItems = new Set<Id>();
        for(Invoice_Line_Item__c item : 
            [SELECT Id, Invocie__r.Id FROM Invoice_Line_Item__c WHERE Id IN :Trigger.New]) {
            lineItems.add(item.Invocie__c);
            
        }
        
         // make a set for unique Invocie__c records       
        List<Invocie__c> updateList = new List<Invocie__c>();
        
        // iterate over each Invocie that had a child record fire a trigger
        for(Invocie__c it : [SELECT Id, TotalAmount__c FROM Invocie__c
                                       WHERE Id IN :lineItems]) {
            // Make A variable for the current record ID being iterated over, so we can Grab only the child records of 1 parent at a time
            Id queryId = it.Id;
            // Set Parent field to zero so we can reset it for each parent record to start a fresh amount summation.
            it.TotalAmount__c = 0;
            // Iterate over each child record from the current parent record being iterated over.                                 
            for(Invoice_Line_Item__c i :
            [SELECT Id, Price__c FROM Invoice_Line_Item__c WHERE Invocie__c = :queryId]){
            // set the Parent TotalAmount__c field to the sum of all child record Price__c fields
            it.TotalAmount__c = it.TotalAmount__c + i.Price__c ;
            
                system.debug(it.TotalAmount__c);
                }
            // Add Updated parent to updateList to bulk inserted after the for loops ran 
           updateList.add(it);
            system.debug(updateList);
			System.debug(updateList.size());
			// Bulk Update all Parent records of triggered Invoice_Line_Item__c child records.                                          
        }   update updateList; 
        
    }

}