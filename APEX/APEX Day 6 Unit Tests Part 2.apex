@isTest
public class seeAllDataTest {

    //creating common test data to run all the test cases
    //Dont use this it will create a mess for you when deploying code, work with 'dummy' data instead
    @isTest(seeAllData=true)
    static void accountTest() {
        List<Account> accountList = [SELECT ID, Name, Phone, Fax, Industry, Rating,
                                     Description FROM Account LIMIT 15];
        System.assertEquals(15, accountList.size(), 'Expected Accounts are not matching!');
    }
    
    @isTest
    static void contactTest() {
    Account acc = new Account(Name = 'TestAcct', Industry = 'Education', Rating = 'Hot',
                              Phone =  '999-1112');
        insert acc;
        Contact con = new Contact(FirstName = 'Amit', LastName = 'Singh', Email = 'abcdefg@gmail.com',
                                 Phone= '987-3432', AccountId = acc.Id);
        insert con;
        List<Contact> contactList = [SELECT Id, Name, Email, Phone FROM Contact LIMIT 1];
        System.assertEquals(1, contactList.size(), 'There are no Contacts available in the Database!');
        }
    
    @isTest
    static void loadDataTest() {
        //List<Account> sobjectList = (List<Account>)
        
       List<Account> sobjectLst = Test.loadData(Account.sObjectType, 'testAccounts');
        Account acc = sobjectLst.get(0);
        System.debug('Account Record ' + acc);
        System.assertEquals(3, sobjectLst.size());
        
       // test.loadData(Schema.sobjectType, staticResourceName);
    }
    
}