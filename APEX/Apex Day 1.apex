String o = 'Hello World';
System.debug('Blob: ' + Blob.valueOf(o));

Boolean isActive = true;
System.debug('Boolean: ' + isActive);

system.debug('Date: ' + Date.newInstance(2021, 07, 06));

Datetime currDaytime = Datetime.now();
system.debug('Date: ' + currDaytime);

system.debug('Time: ' + Time.newInstance(22, 40, 26, 03));

Decimal decValue = 21.02;
System.debug('Decimal: ' + decValue);

ID recordID = [SELECT ID FROM Account Limit 1][0].ID;
System.debug('ID: ' + recordID);

Integer wholeNumber = 33;
System.debug('Integer: ' + wholeNumber);

Long longValue = 2789655345L;
System.debug('Long: ' + longValue);

Blob bBinary = Blob.valueOf('shfjhgfjhdgfjfd');
system.debug(bBinary);
system.debug(bBinary.toString());  //returns a string type

Object objValue = o;
system.debug('Object: '+ objValue);

List<Integer> listOfNumbers = new List<Integer>();
listOfNumbers.add(1);
listOfNumbers.add(2);
listOfNumbers.add(3);
listOfNumbers.add(3);
System.debug('listOfNumbers: ' + listOfNumbers);

Set<Integer> setOfNumbers = new Set<Integer>();
setOfNumbers.add(3);
setOfNumbers.add(2);
setOfNumbers.add(2);
setOfNumbers.add(1);
System.debug('setOfNumbers: ' + setOfNumbers);

Map<Integer, String> mapOfIntegerString = new Map<Integer, String>();
mapOfIntegerString.put(1, 'one');
mapOfIntegerString.put(2, 'two');
mapOfIntegerString.put(3, 'three');
mapOfIntegerString.put(3, 'four');
System.debug('mapOfIntegerString: ' + mapOfIntegerString);
System.debug('Value at 3: ' + mapOfIntegerString.get(3));

List<Integer> listOfNumberss = new list<Integer>();
Integer maxListSize = 12;
for (Integer i = 1 ; i <= maxListSize; i++) {
    listOfNumberss.add(i);
}
System.debug('listOfNumberss: ' + listOfNumberss);

//Make a list and fill it with integers from 1 to 10
Integer totalSum = 0;
List<Integer> listOfNumbers = new List<Integer>();
for (Integer i = 1 ; i <= 10 ; ++i){
        listOfNumbers.add(i);
}   
System.debug('listOfNumbers: ' + listOfNumbers);

//Make a condition so that only the even numbers from the list are selected and then summ over them
for(Integer i = 1; i < listOfNumbers.size(); i++) {
    if(Math.mod(listOfNumbers[i],2) == 0){
    totalSum = totalSum + listOfNumbers[i];
    System.debug('totalSum value: ' + totalSum);
 }
}
System.debug('final summation: ' + totalSum);

//Excersize 1
List<Integer> oddNumbers = new List<Integer>();
Integer sumEvenNum = 0;
for(Integer i = 1; i <= 20; i++){
    if(Math.mod(i,2) == 1){
        oddNumbers.add(i);
    } else {
        sumEvenNum = sumEvenNum + i;
    }
}
System.debug('oddNumbers: ' + oddNumbers);
System.debug('sumEvenNum value: ' + sumEvenNum);

//Excersize 1 with a while loop
List<Integer> oddNumbers = new List<Integer>();
Integer sumEvenNum = 0;
Integer i = 1;
while(i < 20){
    i++;
    if(Math.mod(i,2) == 1){
        oddNumbers.add(i);
    } else {
        sumEvenNum = sumEvenNum + i;
    }
}
System.debug('oddNumbers: ' + oddNumbers);
System.debug('sumEvenNum value: ' + sumEvenNum);

