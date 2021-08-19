
//This test class is an example of NOT best practices because we create the account in eacht test
@isTest

public class MyTestClass {
    
    @isTest  
    static void accountTest() {
        Account acc = new Account(Name = 'TestAcc', Industry = 'Education', Rating = 'Hot', Phone = '999-1112');
        
        insert acc;
        }

    @isTest
    static void contactTest() {
        
        Account acc = new Account(Name = 'TestAcc', Industry = 'Education', Rating = 'Hot', Phone = '999-1112');
        
        insert acc;
        Contact con = new COntact(FirstName = 'Amit', LastName = 'Singh', Email= '123gghhaaa@gmail.com', AccountId = acc.Id);
        
        insert con;
    }
    
    @isTest
    public static void opportunityTest() {
        
        Account acc = new Account(Name = 'TestAcc', Industry = 'Education', Rating = 'Hot', Phone = '999-1112');
        
        insert acc;
        Opportunity opp = new Opportunity(Name = 'Dicson Plc.', AccountId = acc.Id,
                    Amount = 989.34, StageName = 'Closed Won', CloseDate = system.today().addMonths(7));
        
        insert opp;
    }
}

//This is the same cde WITH best practices because we only create the account once and query it later
@isTest

public class MyTestClass {
    
    @TestSetup
    static void mySetupData() {
             Account acc = new Account(Name = 'TestAcc', Industry = 'Education', Rating = 'Hot', Phone = '999-1112');
        
        insert acc;
    }
    
    @isTest 
    static void accountTest() {
        Account accountrecord = [SELECt Id FROM Account WHERE Name = 'TestAcc'];
        System.debug(''+ accountrecord);
        System.assertNotEquals(null, accountrecord);
        }

    @isTest
    static void contactTest() {
        
        Account accountrecord = [SELECt Id FROM Account WHERE Name = 'TestAcc'];
        
        Contact con = new Contact(FirstName = 'Amit', LastName = 'Singh', Email= '123gghhaaa@gmail.com', AccountId = accountrecord.Id);
        
        insert con;
    }
    
    @isTest
    public static void opportunityTest() {
        Account accountrecord = [SELECt Id FROM Account WHERE Name = 'TestAcc'];
        
        Opportunity opp = new Opportunity(Name = 'Dicson Plc.', AccountId = accountrecord.Id,
                    Amount = 989.34, StageName = 'Closed Won', CloseDate = system.today().addMonths(7));
        
        insert opp;
    }
}






//Here we only run the 200 account creation once and reference it later
@isTest
public class CommonTestSetup {
    
    @testSetup
    //this is a test in Bulcification we're creating 200 accounts
    static void setup() {
        List<Account> testAccts = new List<Account>();
        for(Integer i=0; i < 200; ++i) {
            testAccts.add(new Account(Name = 'TestAcc'+ i, Industry = 'Education', Rating = 'Hot', Phone = '999-111'+i));
        }
        insert testAccts;
    }
    
       @isTest
    static void testMethod1() {
        //get the first test account by using a soql query
       Account acct =  [SELECT Id FROM Account WHERE Name = 'TestAcc0' LIMIT 1];
        //Modify first account's phone
            acct.Phone = '555-1212';
        update acct;
        
        //Delete 2nd Account
        Account acct2 = [SELECT Id FROM Account WHERE Name= 'TestAcc1' LIMIT 1];
        //This deletion is local to this test method only
        delete acct2;
    }
    
    @isTest
    static void testMethod2() {
        
        //The changes made by testMethod1() are rolled back
        //and are not visible to this test method.
        //Get the first Account by using a soql query
        Account acc = [SELECT Phone FROM Account WHERE Name = 'TestAcc0' LIMIT 1];
        //Verify that test Account created by the testsetup method is unaltered
        System.assertEquals('999-1110', acc.Phone);
        //get the 2ns account by using a soql query
        Account acc2 = [SELECT Id FROM Account WHERE Name = 'TestAcc1' LIMIT 1];
        //verify test account created by the testSetup method is unaltered.
        System.assertNotEquals(NULL, acc.Id);
    }
}