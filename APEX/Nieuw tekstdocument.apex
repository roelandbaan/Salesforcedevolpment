String o = 'Hello World';
System.debug('Blob' + Blob.valueOf(o));

Boolean isActive = true;
System.debug('Boolean' + isActive);

system.debug('Date' + Date.newInstance(2021, 07, 06));

Datetime currDaytime = Datetime.now();
system.debug('Date' + currDatetime);

system.debug('Time' + Time.newInstance(22, 40, 26, 03));

Decimal decValue = 21.02;
System.debug('Decimal' + decValue);

ID recordID = [SELECT ID FROM Account Limit 1][0].ID;
System.debug('ID' + recordID);

Integer wholeNumber = 33;
System.debug('Integer' + wholeNumber);

Long longValue = 2789655345L;
System.debug('Long' + longValue);

Object objValue = o;
system.debug('Object'+ objValue);