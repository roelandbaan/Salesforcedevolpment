// The Trigger
trigger EmployeeChangeTrigger on Employee__ChangeEvent (after insert) {
    
		EmployeeChange.HandleEmployeeChange(Trigger.new);
}

// The CLass 
public class EmployeeChange {

    
    public static void HandleEmployeeChange(List<Employee__ChangeEvent> changeEventList) {
        list<Task> tasks = new List<Task>();
        for(Employee__ChangeEvent event : changeEventList) {
            // get some header fields
            EventBus.ChangeEventHeader header = event.ChangeEventHeader;
            system.debug('Recieved change event for ' + header.entityname + ' for the ' + header.changetype + ' operation');
            // for update operations, we can get a list of changed fields
            if (header.changetype == 'UPDATE') {
                system.debug('List of all changed fields: ');
                for(String field : header.changedfields) {
                    if(null == event.get(field)) {
                        system.debug('Deleted field value (set to null): ' + field);
                    } else {
                        system.debug('Changed field value: ' + field + '. New Value: ' + event.get(field));
                    }
                }
            }
            // Get record fields and display them only if they are not null.
            system.debug('Some employee record fields from the change event:');
            if(event.First_Name__c != null) {
                system.debug('First name: ' + event.First_Name__c);
            }
            if(event.Last_Name__c != null) {
                system.debug('Last name: ' + event.Last_Name__c);
            }
            if(event.Name != null) {
                system.debug('Name: ' + event.Name);
            }
            if(event.Tenure__c != null) {
                system.debug('Tenure: ' + event.Tenure__c);
            }
            // create a follow up task
            Task tk = new Task();
            tk.Subject = 'Follow up on Employee record(s)' + header.recordids;
            tk.OwnerId = header.commituser;
            tasks.add(tk);
        }
        if(tasks.size() > 0) {
        insert tasks;
        }
    }
}


// The test Class
@isTest public class testEmployeeChange {
    
    @isTest static void HandleEmployeeChange() {
        // Enable all Change Data Capture entities for notifications.
        Test.enableChangeDataCapture();
        // Insert an Employee test record
        insert new Employee__c(Name = 'e-100',
                       First_Name__c = 'Astro',
                       Last_Name__c = 'Test',
                       Tenure__c = 1);
        // Call deliver to fire the trigger and deliver the test change event.
        Test.getEventBus().deliver();
        // VERIFICATIONS
        // Check that the change event trigger created a task.
        Task[] taskList = [SELECT Id, Subject FROM Task];
        System.assertEquals(1, taskList.size(), 'The change event trigger did not create the expected task.');
        // Update employee record
        Employee__c[] empRecords = [SELECT Id, OwnerId, First_Name__c, Tenure__c FROM Employee__c];
        // There is only one test record, so get the first one
        Employee__c emp = empRecords[0];
        // Debug
        System.debug('Retrieved employee record: ' + emp);
        // Update one field and empty another
        emp.First_Name__c = 'Codey';
        emp.Tenure__c = null;
        update emp;
        // Call deliver to fire the trigger for the update operation.
        Test.getEventBus().deliver();
         // VERIFICATIONS
       // Check that the change event trigger created a task.
       // We should have two tasks now, including one from the first trigger invocation.
       Task[] taskList2 = [SELECT Id, OwnerId FROM Task];
        System.assertEquals(2, taskList2.size(), 'The change event trigger did not create the expected task.');
    }

}