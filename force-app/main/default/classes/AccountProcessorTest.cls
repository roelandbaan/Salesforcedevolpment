@isTest
private class AccountProcessorTest
{

    @TestSetup
    static void makeData()
    {
        Account acc = new Account(Name = 'AccountName');
        insert acc;
        Contact con = new Contact(FirstName = 'Mike', LastName = 'Hoover', AccountId = acc.Id);
        insert con;
    }

    @isTest
    static void testThingy()
    {
        Account acc = [SELECT Id, Number_Of_Contacts__c FROM Account LIMIT 1];
        Test.startTest();
        AccountProcessor.countContacts(acc.Id);
        Test.stopTest();
        Account accs = [SELECT Id, Number_Of_Contacts__c FROM Account LIMIT 1];
        system.AssertEquals(1, accs.Number_Of_Contacts__c);
    }
}
