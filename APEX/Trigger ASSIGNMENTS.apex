//Trigger 1 Create a related contact on account creation

trigger CreateConForNewAcc on Account (after insert) {
    
    List<Contact> cList = new List<contact>();
    for(Account acc : Trigger.new) {
        Contact c = new Contact(LastName = acc.Name + 'con', Phone = acc.Phone,
        AccountId = acc.Id);
        clist.add(c);
    }insert cList;

}


//Trigger 2 Update related contact owner id fields with parent account owner id field if it is updated.

trigger UpdateOwner on Account (After Update) {
    
//Make maps, set and an array to store variables for later reference
    Contact[] contactUpdates = new Contact[0];
    Set<Id> accIDs = new Set<Id>();
    Map<Id, String> newOwnerIds = new Map<Id, String>();
    Map<Id, String> oldOwnerIds = new Map<Id, String>();
    
    //Get the account id and store it if the ownerID is updated
    for(Account acc : Trigger.new){
        if(Acc.OwnerId != Trigger.oldMap.get(acc.Id).OwnerId){
            newOwnerIds.put(acc.Id, acc.OwnerId);
            oldOwnerIds.put(acc.Id, Trigger.oldMap.get(acc.id).OwnerId);
            accIDs.add(acc.Id);
        }
       //If there are Account Ids stored in my list (meaning its OwnerId is updated)
       //query for the related contacts of that account 
       //and make 2 strings for later reference 
    } if(!accIDs.isEmpty()){
        for(Account a :[SELECT Id, (SELECT Id, OwnerId FROM Contacts)FROM Account WHERE Id in :accIDs ]){
            String newOwnerId = newOwnerIds.get(a.Id);
            String oldOwnerId = oldOwnerIds.get(a.Id);
     //check for all queried results if their OwnerId is equal to the old account OwnerId
     //if true set Owner id for contact to new OwnerID add it to the contactUpdates Array and update
            for(Contact c :a.Contacts) {
                if(c.OwnerId == oldOwnerId){
                   Contact updatedContact = new Contact(OwnerId = newOwnerId);
                    contactUpdates.add(updatedContact);
                }
            }
        }
    }update contactUpdates;
        
}



// Trigger 3 Creates an opportunity if an account is created with or updated to Industry type Agriculture.

trigger CreateOpportunity on Account (after insert, after update) {

    List<Opportunity> oppList = new List<Opportunity>();
     for(Account acc : Trigger.new){
        if(Acc.Industry == 'Agriculture'){
            Opportunity o = new Opportunity(Name = acc.Name + ' opp', StageName = 'Prospecting',
            Amount = 0, CloseDate =Date.Today().addDays(90), AccountId = acc.Id);
            oppList.add(o);
        }
    } insert oppList;
}


// Trigger 4 Prevent an account from being deleted if it has related contacts.

//This code makes a list of all the accounts with contacts and checks if the account you are trying to delete is in that list
//Not optimal for your system performance if your search returns a lot of accounts
trigger ValidationOnAccountDelete on Account (before delete) {

Set<Id> accountsWithContacts = new Set<Id>();
for(Contact c : [SELECT Id, AccountId FROM Contact WHERE AccountId in :trigger.oldMap.keySet()]) {
    accountsWithContacts.add(c.AccountId);
}
for(Id id : accountsWithContacts) {
    trigger.oldMap.get(id).addError('Account cannot be deleted while there are related contacts');
}
}

//This looks better 
trigger validation_using_Trigger on Account (before delete) {
    
    for(Account acc : Trigger.Old) {
        if(acc.Contacts != null){
         acc.addError('Account cannot be deleted while there are related contacts');  
        }
    }

}



// Trigger 5 Only Admins can delete closed opportunities and send an email to account and opportunity owner on Stage converison to Closed Won


// This trigger allows only admins to delete closed opportunities and sends an email to Opp owners if the Stagename is set to closed won

trigger OpportunityManagement on Opportunity (after insert, after update, before delete) {
    
    if(trigger.isDelete) {
        OppManager.onlyAdminDelete(trigger.old);
    }
    
    if(trigger.isUpdate||trigger.isInsert){
          OppManager.opportunityMailer();      
    }

}



    
    public class OppManager {
    
    public static void onlyAdminDelete(Opportunity[] triggerOld){
        // Check if the User Doesnt have a System Administratoradmin profile
        if([Select Profile.Name FROM User WHERE
            Id = :UserInfo.getUserId()].Profile.Name != 'System Administrator') {
        // If the user doesnt then For each 'Closed Won/Closed' Lost Opportunity Add an error and prevent deletion   
                for(Opportunity opp : triggerOld) {
                    if(opp.STageName == 'Closed Won'|| opp.StageName == 'Closed Lost') {
                        opp.addError('Only Admins can delete closed Opportunities');
                    }
                }
            }
       }
    
    public static void opportunityMailer() {
        
        // Make a list of all Opportunities which are inserted/updated and closed won
        List<Opportunity> oppMailList = [SELECT Id, OwnerId, Name, StageName, Account.OwnerId, Owner.Email, Account.Owner.Email
                                        FROM Opportunity WHERE StageName = 'Closed Won' AND Id IN :Trigger.New];
        
        // Make a list of emails to be sent
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        
        // If there are new/updated opps Closed won iterate over them
        if(!oppMailList.isEmpty()){
        for(Opportunity opp : oppMailList) {
        // save the old Opportunity record and check if the stage name is different then the new value    
            Opportunity oldOpp = (Opportunity)trigger.oldMap.get(opp.Id);
           if(opp.StageName != oldOpp.StageName) {
           
         // Make an empty email   
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
         // check if the account and opportunity owner are the same and set 1 or 2 adressess to the email  
          //  Only do this for Opportunities with accounts to avoid errors       
                if(opp.AccountId != null) {
                if(opp.OwnerId == opp.Account.Owner.Id) {
                    mail.setToAddresses(new List<String> {opp.Owner.Email});
                } Else {
                    mail.setToAddresses(new List<String> {opp.Owner.Email, opp.Account.Owner.Email});
                }
                } Else {
                    mail.setToAddresses(new List<String> {opp.Owner.Email});
                }
               // make the email template
                mail.setSubject('Opportunity Closed won');
                mail.setPlainTextBody('The following Opportunity with name: ' + opp.Name + 'and Id: ' 
                                     + opp.Id + 'Is now Closed Won');
               // add the email(for each iteration over an opportunity record)
                mails.add(mail);
            }
        }    Messaging.sendEmail(mails);
    }   
    }
}



//To fetch the Email Address of Owner of Opportunity records

SELECT Owner.Email FROM Opportunity WHERE Opportunity.Id in:OppIds


//To fetch the Email Address of Owner of Account in Opportunity records

SELECT Account.Owner.Email FROM Opportunity WHERE Opportunity.Id in:OppIds






//MC Fergus Code
trigger OpportunityTrigger on Opportunity (before delete, after update) { // Run this code for before delete operation. 
if(Trigger.isBefore && Trigger.isDelete) { 
// Get the admin profile. 
	Profile adminProfile = [Select Id From Profile Where Name = 'System Administrator' LIMIT 1]; 
	// Iterate through each opportunity and check if the current user's profile is admin 
// and if the opportunity is closed won or closed lost 
// throws the error if the above condition is true 
for(Opportunity opp : Trigger.old) { 
	if(System.UserInfo.getProfileId() != adminProfile.Id && (opp.StageName == 'Closed Won' || opp.StageName == 'Closed Lost')) { 
	opp.addError('You do not have necessary permissions to delete Closed opportunities.'); 
} 
} 
} 


// Run this code whenever opportunity is updated 
if(Trigger.isAfter && Trigger.isUpdate) { 
// Get all the Closed Won opportunities which were updated 
	List<Opportunity> oportunities = [Select Id, OwnerId, Name, StageName, Account.OwnerId, Owner.Email, Account.Owner.Email 
From Opportunity Where Id IN 
:Trigger.newMap.keySet() // hiermee selecteer je records die geupdate zijn
AND StageName='Closed Won']; 
if(!oportunities.isEmpty()) { 
	// Create an empty list of mail messages which need to be sent.
List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>(); 
for(Opportunity opp : oportunities) { 
Messaging.SingleEmailMessage emailMessage = new Messaging.SingleEmailMessage(); 
// Check if Opportunity owner and account owner are same 
	// if yes, then set only 1 email address to the 'To Address' so that 2 emails are not sent to the same owner 
// else add email of both owners 
	// set subject and text body of the email as well and add the email to list of emails 
if(opp.OwnerId == opp.Account.OwnerId) { 
	emailMessage.setToAddresses(new List<String> {opp.Owner.Email,}); } 
else { 
emailMessage.setToAddresses(new List<String> {opp.Owner.Email, 
opp.Account.Owner.Email}); 
} 
emailMessage.setSubject('Opportunity - Closed Won'); 
	emailMessage.setPlainTextBody('Below Opportunity with Opportunity Id and Name is now Closed Won.\n' + 
'Opportunity Id: ' + opp.Id + '\n' + 
'Name: ' + opp.Name);
} 
mails.add(emailMessage); 
// Send list of emails 
Messaging.sendEmail(mails); 
} 
} 
}


// Trigger 6

trigger RelatedContactCount on Contact (after Insert, after Update, after Delete) {
    
    if(Trigger.isAfter) {
        RelatedContactsCounter.Counter(trigger.oldMap, trigger.newMap);
    }

}



public class RelatedContactsCounter {
    
    public static void Counter(Map<Id, AccountId>triggerOld, Map<Id, AccountId>triggerNew) {
        // Make a set of unique parent accounts for triggered child contacts
        set<Id> accIds = new Set<Id>();
        // trigger new for update and insert
        if (trigger.isInsert||trigger.isUpdate) {
        
        for(Contact con : [SELECT Id, AccountId FROM Contact WHERE Id IN :Trigger.new]) {
            
            accIds.add(con.AccountId);
        }
        // Trigger old for Delete   
        } else if(trigger.isDelete){
            
        for(Contact con : [SELECT Id, AccountId FROM Contact WHERE Id IN :Trigger.old]) {
            
            accIds.add(con.AccountId);
        }
        }
        system.debug('accIds' + accIds);
        
        // Make a list with accounts with updated Total contacts
        List<Account> UpdateList = new List<Account>();
        
        // Iterate over each account which had a child contact fire a trigger
        for(Account acc : [SELECT Id, Total_Contacts_Count__c, (SELECT Id FROM Contacts) FROM Account WHERE Id in :accIds]) {
            //set total contacts to zero 
            acc.Total_Contacts_Count__c = 0;
            // If trigger is delete set count to -1 cause the deleted Contact will be counted as related contact
            if(trigger.isDelete) {
                acc.Total_Contacts_Count__c = -1;
            }
            //set Id of current record to a variable for later reference
            Id thisAcc = acc.Id;
            // increment Total Contacts by +1 for each related contact
            for(Contact con : [SELECT Id, AccountId FROM Contact WHERE AccountId = :thisAcc]) {
                acc.Total_Contacts_Count__c = acc.Total_Contacts_Count__c + 1;
            }
            updateList.add(acc);
        }
        update updateList;
    }

}


// Trigger 6 Version 2

public class RelatedContactsCounter {
    
    public static void Counter() {
        // Make a set of unique parent accounts for triggered child contacts
        set<Id> accIds = new Set<Id>();
        // trigger new for update and insert
        if (trigger.isInsert||trigger.isUpdate) {
        
        for(Contact con : [SELECT Id, AccountId FROM Contact WHERE Id IN :Trigger.new]) {
            
            accIds.add(con.AccountId);
        }
        // Trigger old for Delete   
        } else if(trigger.isDelete){
            
        for(Contact con : [SELECT Id, AccountId FROM Contact WHERE Id IN :Trigger.old]) {
            
            accIds.add(con.AccountId);
        }
        }
        system.debug('accIds' + accIds);
        
        // Make a list with accounts with updated Total contacts
        List<Account> UpdateList = new List<Account>();
        
        // Iterate over each account which had a child contact fire a trigger
        for(AggregateResult ar : [SELECT AccountId AcctId, COUNT(id) ContactCount FROM Contact WHERE
                                 AccountId in :accIds GROUP BY AccountId]) {
          Account acc = new Account();
          acc.Id = (Id)ar.get('AcctId'); //---> handy trick for updates, set the id and update
          acc.Total_Contacts_Count__c = (Total_Contacts_Count__c)ar.get('ContactCount');
            updateList.add(acc);
        }
        update updateList;
    }

}