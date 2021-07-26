//Example of a trigger syntax
trigger TriggerName on ObjectName (trigger_events) {
    			code_block
}

trigger myAccount on Account (before insert, before update) {
    			code_block	
}



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