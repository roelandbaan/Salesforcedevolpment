//Trigger 1 Create a related contact on account creation

trigger CreateConForNewAcc on Account (after insert) {
    
    List<Contact> cList = new List<contact>();
    for(Account acc : Trigger.new) {
        Contact c = new Contact(LastName = acc.Name + 'con', Phone = acc.Phone,
        AccountId = acc.Id);
        clist.add(c);
    }insert cList;

}


//Trigger 2 Update related contact owner id fields with parent account owner id field if it is updated

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



Trigger 3 Creates an opportunity if an account is created with or updated to Industry type Agriculture.

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


Trigger 4 Prevent an account from being deleted if it has related contacts.

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

//This looks better but i dont know how to define the if criteria 
trigger validation_using_Trigger on Account (before delete) {
 for(Account acc:trigger.old){
    if([SELECT (SELECT Id FROM Contacts) FROM Account]!= null){
        String op = get(acc.Id).Contacts;
       acc.adderror('Account cannot be deleted while there are related contacts');
    }
 }
}


Trigger 5 Only Admins can delete closed opportunities and send an email to account and opportunity owner on Stage converison to Closed Won


//This trigger allows only admins to delete closed opportunities and sends an email to Opp owners if the Stagename is set to closed won

trigger OpportunityManagement on Opportunity (after update, after insert, before delete) {

   if(Trigger.isAfter){
       if(Trigger.isUpdate || Trigger.isInsert){
             for(Opportunity o: Trigger.new) {
                  MailToOpp_AccOwner.oppMailer(Trigger.New, Trigger.OldMap);
                }
        }
    }
    
    if(Trigger.isDelete){
       if([Select Profile.Name FROM User WHERE Id = :UserInfo.getUserId()].Profile.Name != 'System Administrator') {
          for(Opportunity opp:trigger.old){
               if(opp.StageName == 'Closed Won' || opp.StageName == 'Closed Lost'){  
               opp.adderror('Only Admins can delete Closed Opportunities');
    }
 }
}
}
}


//The Email sending class that is being initiated
//ERROR CANT get the email adress into a variable for later reference can only make it work if i dirctly type in the email adress

To fetch the Email Address of Owner of Opportunity records

SELECT Owner.Email FROM Opportunity WHERE Opportunity.Id in:OppIds


To fetch the Email Address of Owner of Account in Opportunity records

SELECT Account.Owner.Email FROM Opportunity WHERE Opportunity.Id in:OppIds


public class MailToOpp_AccOwner {
    
   public static void  oppMailer(List<Opportunity> triggerNew , Map<Id,Opportunity> oppOldMap){
          Map<Id,String> opportunityMap = new Map<Id,String>();

               String[] toAddresses = new String[];

               for(Opportunity opp: triggerNew){
               if(opp.StageName == 'Closed Won'){
        List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
        List<String> emailad =  [Select Id, OwnerId, Name, StageName, Account.OwnerId, Owner.Email, Account.Owner.Email 
        From Opportunity];
        emailad.get(Account.Owner.Email, Owner.Email);    
        
                      
        
        toAddresses.add(emailad.get(Account.Owner.Email, Owner.Email));}
               }
        for(Opportunity opp : trigger.new) {           
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSubject('Apex mail without template');
        mail.setPlainTextBody('Enter email text content here');
        mail.setToAddresses(toAddresses);
        mailList.add(mail);
        
        if(!mailList.isEmpty())
            Messaging.sendEmail(mailList);
             }
          }


     }


// Get all the Closed Won opportunities which were updated 
List<Opportunity> oportunities = [Select Id, OwnerId, Name, StageName, Account.OwnerId, Owner.Email, Account.Owner.Email 
From Opportunity Where Id IN 
:Trigger.newMap.keySet() 
AND StageName='Closed Won'];



Trigger 6 


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
	// Create an empty list of mail messages which need to be sent. List<Messaging.SingleEmailMessage> mails = new 
List<Messaging.SingleEmailMessage>(); 
for(Opportunity opp : oportunities) { 
Messaging.SingleEmailMessage emailMessage = new 
Messaging.SingleEmailMessage(); 
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