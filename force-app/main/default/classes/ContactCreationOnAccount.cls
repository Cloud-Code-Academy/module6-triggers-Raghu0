public with sharing class ContactCreationOnAccount {
    
    public static void contactCreation(List<Account> oldAccounts){
        String contactLastName = 'DefaultContact';
        String contactEmail = 'default@email.com';
        List<Contact> contactToBeCreated = new List<Contact>();
        for(Account acc : oldAccounts){
            Contact c = new Contact();
            c.LastName = contactLastName;
            c.Email = contactEmail;
            c.AccountId = acc.Id;
            contactToBeCreated.add(c);
        }
        insert contactToBeCreated;
    }
}
