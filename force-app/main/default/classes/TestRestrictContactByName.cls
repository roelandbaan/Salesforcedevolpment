@isTest
private class TestRestrictContactByName
{

    @isTest
    static void testInsertingCon()
    {
    Contact con = new Contact(LastName = 'INVALIDNAME');
    insert con;
    }
}
