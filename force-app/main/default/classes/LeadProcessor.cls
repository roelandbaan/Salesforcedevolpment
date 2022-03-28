public class LeadProcessor implements Database.Batchable<sObject>
{
    public Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator('SELECT Id, LeadSource FROM Lead');
    }

    public void execute(Database.BatchableContext bc, List<lead> scope)
    {
        List<Lead> leadList =  new List<Lead>();
        for (Lead leadrecord : scope) {
            leadrecord.LeadSource = 'Dreamforce';
            leadList.add(leadrecord);
        }
        update leadList;
    }

    public void finish(Database.BatchableContext bc)
    {
        AsyncApexJob job = [SELECT Id, Status, JobItemsProcessed FROM AsyncApexJob WHERE Id = : bc.getJobId()];
        system.debug('job Id:' +  job.Id + ' status: ' + job.status + ' number of items: ' + job.JobItemsProcessed);
    }
}
