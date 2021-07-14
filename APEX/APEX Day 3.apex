public class DebugPrinter {

    public static void doPrint(){
        system.debug('Hello everyone!!');
    }
}
//When u call a static class u dont need to Initiate it with the new keyword
DebugPrinter.doPrint();

//simple SOQL query that fetches 10 accounts and displays the ID and name fields
Select ID, Name from Account limit 10