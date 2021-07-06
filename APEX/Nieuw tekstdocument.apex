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
for (Integer i = 1;i <= maxListSize; i++){
    listOfNumberss.add(i);
}
System.debug('listOfNumberss: ' + listOfNumberss);

