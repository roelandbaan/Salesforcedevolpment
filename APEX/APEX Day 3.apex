public class DebugPrinter {

    public static void doPrint(){
        system.debug('Hello everyone!!');
    }
}
//When u call a static class u dont need to Initiate it with the new keyword
DebugPrinter.doPrint();

//simple SOQL query that fetches 10 accounts and displays the ID and name fields
Select ID, Name from Account limit 10

public class MathCalculator {
    
    private static Integer add(Integer a, Integer b) {
        return a + b;
        }

    private static Integer multiply(Integer a, Integer b) {
        return a * b;
    }

    private static Integer subtract(Integer a, Integer b) {
        return a - b;
    }
    
    private static void printOutput(Integer a, Integer b) {
        System.debug('Add: ' + add(a,b));
        System.debug('Multiply: ' + multiply(a,b));
        System.debug('Subtract: ' + subtract(a,b));
    }
    
    public void doMath(Integer a, Integer b){
        printOutput(a,b);
        
    }
}


public with sharing class MyDebugPrinter {
    public MyDebugPrinter() {

    }

    public static void doPrint() {
        System.debug('This is my first class using VS code');
    }
}

string tempvar = 'Roeland';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);