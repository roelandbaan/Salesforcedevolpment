public class AccountProcessor
{
    
    @future
    public static void countContacts(Id accountId)
    {
        Integer numOfContacts = [SELECT COUNT() FROM Contact WHERE Contact.AccountId =:accountId];
        Account acc = [SELECT Id, Number_Of_Contacts__c FROM Account WHERE Id = :accountId];
        acc.Number_Of_Contacts__c = numOfContacts;
        update acc;
    }

}
