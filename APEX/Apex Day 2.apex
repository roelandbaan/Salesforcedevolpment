List<String> testList = new List<String>();
for(Integer = 0; i < 9; i++){
testList.add('Test '+ i);
}
System.debug(testList);



public class StringArrayTest {
    
    public static List<String> generateStringArray(Integer n){    
 List<String> testList = new List<String>();
for(Integer = 0; i < n; i++){
testList.add('Test '+ i);
}
System.debug(testList);
    }  
}

//defining a simple class and method in Apex
public class Demo1 {

    public void printOutput(String stringToDisplay){
        System.debug('Display text: ' + stringToDisplay);
    }
}


public class Demo2 {
    
    public String helloWorldString;						//Instance Member Variables
    private static final String DEFAULT_STRING;		//Static member Variables
    
    static{											//Static Initializer Block
        DEFAULT_STRING = 'Hello World';
    }
    
    public Demo2(){									// Constructor
        this(DEFAULT_STRING);
        }

    public Demo2(String stringToDisplay){		  	//Overloaded contstructor
        this.helloWorldString = stringToDisplay;
    }
    
    public void printOutput(){								//Method
        System.debug('Display text: ' + helloWorldString);
   } 

       public static void printOutput1(){					//Static Method
        System.debug('Display from static method');
   } 
}

//Invoking instance methods
Demo2 d2 = new Demo2();
d2.printOutput();

Demo2 d2 = new Demo2('Hello Roeland');    //Invoking overloaded Constructor
d2.printOutput();

//Invoking a static method
Demo2.printOutput1();


//Pass by Reference and Pass by Value
public class Demo3 {

    public void mainValueMethod(){
        
        String websiteUrl = 'www.apexhours.com';
        
        System.debug('Before value call: ' + websiteUrl);
        passByValueCall(websiteUrl);
        System.debug('After value call: ' + websiteUrl);
    }
    
    private void passByValueCall(String websiteUrlValue){			//Pass by Value Call
        websiteUrlValue = 'www.salesforce.com';
    }
    
    public void mainReferenceMethod(){
        
        Account a = new Account();
        a.Name = 'Test Account';
        a.Website = 'www.apexhours.com';
        
        System.debug('Before reference call: ' + a);
        passByRefCall(a);
        System.debug('After reference call: ' + a);
    }
    
    private void passByRefCall(Account a){						//Pass by Reference Call
        a.website = 'www.salesforce.com';
    } 
    
}


Demo3 d3 = new Demo3();
d3.mainValueMethod();		//Pass by Value Call

d3.mainReferenceMethod();	//Pass by Reference


//Virtual Classes and methods
public virtual class Stringwriter {
    
    public virtual void printString(){
        System.debug('This is the default string');
    }

}

public class HTMLStringwriter extends StringWriter {
    
    public override void printString(){
        System.debug('<p>This is am HTML string <p>');
    } 

}

//Running the virtual class and the altered virtual class where u call the same method but the behaviour is different
StringWriter sw1 = new StringWriter();
sw1.printString();

HTMLStringWriter sw2 = new HTMLStringWriter();
sw2.printString();



//Interfaces and interacting with them
public interface IAreaCalculator {
    
    void computeArea();                 //Interface methods are always public otherwise they wouldnt be accessable

}

//making a class that interacts with the interface
public class SquareAreaCalculator implements IAreaCalculator {
    
    public void computeArea(){
        System.debug('Computes the area of a Square');
    }

}
IAreaCalculator sac = new SquareAreaCalculator();
sac.computeArea();


//Excersize day 2
public class MathCalculator {
    
    private static Integer add(Integer a, Integer b){
        return a+b;
        }

    private static Integer multiply(Integer a, Integer b){
        return a*b;
    }
    
    private static void printOutput(Integer a, Integer b){
        System.debug('Add: ' + add(a,b));
        System.debug('Multiply: ' + multiply(a,b));
    }
    
    public void doMath(Integer a, Integer b){
        printOutput(a,b);
        
    }
}
//Invoking an instance method
MathCalculator m1 = new Mathcalculator();
m1.doMath(2,4);