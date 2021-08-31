

public class Flower {
    
    public static Integer wilt(Integer numberOfPetals) {
        if(numberOfPetals >= 1) {
            numberOfPetals--;
        } return numberOfPetals;
    }
    public static void grow(Integer height, Integer maxHeight) {
        height = height + 2;
        if(height >= maxHeight) {
            pollinate();
        }
    }
    public static void pollinate() {
        System.debug('pollinating...');
    }

}


Account myAcc = new Account();
myAcc.Name = 'The Teas Fatory'
myAcc.AccountNumber = 123456;
myAcc.Phone = '1234-5678'; 

Account myAcc2 = new Account();
myAcc2.Name= 'Tinas, Teas'; 
myAcc2.Phone = '8765-8654';
myAcc2.AccountNumber = 2345676;



public class NewAccounts {
    
    public static void sObjectsInsert(Integer value) {
        Integer counter = 1;
        //create a list to add our accounts
        List<Account> teaFactoryAccounts = new List<Account>();
        while(counter <= value) {
            //display the current counter value
            System.debug('Counter value before incrementing' + counter);
            Account store = new Account();
            store.Name = 'The Tea Factory'+ counter;
            teaFactoryAccounts.add(store);
            System.debug(teaFactoryAccounts);
            //increnment the counter
            counter++;
            System.debug('Counter value after incrementing' + counter);
        }
        System.debug('Size of account list: ' + teaFactoryAccounts.size());
        System.debug('Elements in account list: ' + teaFactoryAccounts);
        //insert all of the accounts in the list
        insert teaFactoryAccounts;
    }
}


// Assignemnt
public class AccountHandler {
    
    public static void insertAccount(Integer i) {
        Integer N = 1;
        List<Account> addAccounts = new List<Account>();
        while(N <= i) {
            //value of N before increment
            System.debug(N);
            Account acc = new Account();
            acc.Name = 'Acme Inc' + N;
            acc.AccountNumber = 'A000' + N;
            N++;
			//Value of N after increment
			System.debug(N);
            addAccounts.add(acc);
        } insert addAccounts;
       
}
}


// Working with Map key-value pairs
public class Tea {
    
    public static void orderTea() {
        Map<String, String> teaTypes = new Map<String, String>();
            System.debug(teaTypes);
        // Maps use Put where lists and sets use add to add data     
        teaTypes.put('Herbal', 'Sweet');
        teaTypes.put('Black', 'Earthy');
        teaTypes.put('White', 'Sweet');
        	System.debug(teaTypes);    
    }

}


//To access values in a map, use the get method, like this: 

mapName.get (key);


// Because the teaTypes map is declared with string values,
// the return type must also be a string (flavorProfile)
public class Tea {
    
    public static String orderTea() {
        Map<String, String> teaTypes = new Map<String, String>();
        teaTypes.put('Herbal', 'Sweet');
        teaTypes.put('Black', 'Earthy');
        teaTypes.put('White', 'Sweet');
        String flavorProfile = teaTypes.get('Herbal');
        	System.debug('The flavor profile of Herbal is: ' + flavorProfile);
        return flavorProfile;
    }

}


// Simple for loop
for(Integer i = 0; i <= 5; i++) {
    System.debug('The current number is: ' + i);
}

// Same loop written as a While loop
Integer i = 0;
While(i < 5) {
    System.debug('The current number is: ' + i);
    i++;
}

// For loops are used when you know how many times the loop should run.
// If you want the loop to stop based on a condition other than the number of times
// it runs you should use the while loop.
// For loops are more concise because they keep the three parts—the variable,
// the condition, and the increment—together in one statement.


// For loop with a list
for (data_type variable_name : list_name or set_name){
    // Loop body
}

//  Example of a for loop with a list
List <String> tea = new List<String>{'Black Tea', 'Green Tea', 'Chai Tea'};
for(String t : tea) {
    system.debug('We have ' + t);
}

