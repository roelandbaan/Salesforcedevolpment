@isTest
public class LeadProcessorTest
{
    @TestSetup
    static void makeData()
    {
        List<Lead> leadList = new List<Lead>();
        for(Integer i = 0; i < 200; i++){
            Lead con = new Lead(LastName = 'company'+ i , Company = 'Comp' + i);
            leadList.add(con);
        }
        insert leadList;
    }

    @isTest
    static void involeBatch()
    {
        List<Lead> leadList = [SELECT Id, LeadSource FROM Lead];
        Test.startTest();
        LeadProcessor leadP = new LeadProcessor();
        Id myBatchId = Database.executeBatch(leadP);
        Test.stopTest();
        System.assertEquals(200, [SELECT COUNT() FROM Lead WHERE LeadSource = 'Dreamforce']);
    }
}
