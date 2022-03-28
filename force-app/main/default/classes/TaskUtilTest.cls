@isTest
public class TaskUtilTest
{

    @isTest
    static void testTaskPriority()
    {
        string pri = TaskUtil.getTaskPriority('NY');
        System.assertEquals('Normal', pri);
    }

    @isTest
    static void testTaskHighPriority()
    {
        String pri = TaskUtil.getTaskPriority('CA');
        System.assertEquals('High', pri);
    }

    @isTest
    static void testTaskPriorityInvalid()
    {
        string pri = TaskUtil.getTaskPriority('Montana');
        System.assertEquals(null, pri);
    }

}
