public class RandomContactFactory
{
    public static List<Contact> generateRandomContacts(Integer numOfContacts, String contactLastName)
    {
        List<Contact> cons = new List<Contact>();
        for(Integer i = 0; i <numOfContacts; i++){
           cons.add(new Contact(LastName = contactLastName +''+ i));
        }
        insert cons;
        return cons;
    }
}
