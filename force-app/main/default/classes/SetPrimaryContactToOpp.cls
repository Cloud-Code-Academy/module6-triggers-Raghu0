public with sharing class SetPrimaryContactToOpp {
    public static void setPrimaryContactOnAccToOpp(List<Opportunity> oppRecords){
        Set<Id> accountIds = new Set<Id>();
        for(Opportunity opp : oppRecords){
            accountIds.add(opp.AccountId);
        }
        List<Opportunity> oppsToBeUpdated = new List<Opportunity>();
        List<Contact> primaryContacts = [SELECT Id, FirstName, LastName, Title, AccountId, CreatedDate 
                                        FROM Contact 
                                        WHERE Title = 'CEO' AND AccountId IN :accountIds];
        for(Opportunity currentOpp : oppRecords){
            for(Contact con : primaryContacts){
                if(con.AccountId == currentOpp.AccountId && con.Title == 'CEO'){
                    currentOpp.Primary_Contact__c = con.Id;
                    oppsToBeUpdated.add(currentOpp);
                }
            }
        }
    }
}