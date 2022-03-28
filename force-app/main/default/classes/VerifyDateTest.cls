@isTest
private class VerifyDateTest
{

    @isTest
    static void testCheckDatesWithin30()
    {
        Date date1 = Date.parse('21-02-2021');
        Date date2 = Date.parse('26-02-2021');
        Date myDate = VerifyDate.CheckDates(date1, date2);
        system.assertEquals(myDate, date2);
    }

    @isTest
    static void testCheckDatesNotWithin30()
    {
        Date date1 = Date.parse('21-02-2021');
        Date date2 = Date.parse('26-04-2021');
        Date myDate = VerifyDate.CheckDates(date1, date2);
        Integer totalDays = Date.daysInMonth(Date1.year(), Date1.month());
        Date lastDay = Date.newInstance(date1.year(), date1.month(), totalDays);
        system.assertEquals(myDate, lastDay);
    }
}
