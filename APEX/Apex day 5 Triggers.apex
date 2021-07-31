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




//Assignment day 5
Trigger LineItemsToInvoice on Invoice_Line_Item__c (after insert, after update) {


}

public class InvoiceMath {

   private static Decimal sum {
       List<Decimal> lstOfLineAmounts= new List<Decimal>();
        for(Invoice_Line_Item__c amount : Trigger.new) {
            //sum over all Invoice_Line_Item__c Amount fields
            

        }update Invoice.Amount;
    }
}