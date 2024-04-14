public with sharing class OppClosedWonDeletionValidation {
    public static void oppsToBeDeleted (List<Opportunity> deletedOpps) {
        // First build a Set of Account Id's and a set of Opportunity Id's with each Opportunity where the StageName == 'Closed Won'
        Set<Id> closedWonOppIds = new Set<Id>();
        for (Opportunity opp : deletedOpps) {
            if (opp.StageName == 'Closed Won') {
                closedWonOppIds.add(opp.Id);
            }
        }

         Set<Id> accountIdsOfClosedWonOpps = new Set<Id>();
        for (Opportunity opp : [SELECT AccountId FROM Opportunity WHERE Id IN :closedWonOppIds]) {
            accountIdsOfClosedWonOpps.add(opp.AccountId);
        }
        // Then I queried the Accounts from the Set of Account Id's where the Industry = 'Banking' and stored them in a Map<Id, Account>
        Map<Id, Account> accountIdToAccountMap = new Map<Id, Account>([
            SELECT Id 
            FROM Account 
            WHERE Id IN :accountIdsOfClosedWonOpps 
                AND Industry = 'Banking'
        ]);
        // Then I looped back through the original list of Opportunities and if it was contained in my Set of opportunity Id's and the Map contained opp.AccountId then I threw an error
        for (Opportunity opp : deletedOpps) {
            if (closedWonOppIds.contains(opp.Id) && accountIdToAccountMap.containsKey(opp.AccountId)) {
                opp.addError('Cannot delete closed opportunity for a banking account that is won');
            }
        }
    }
}
/* Hello Reviewer, I initially tried this code but somehow this logic couldn't pass through the test but later
 improvised to the above with the help of a friend in the cohort. Can you please comment on the below code too?

 
public with sharing class OppClosedWonDeletionValidation {
    public static void oppsToBeDeleted (List<Opportunity> deletedOpps) {
        for(Opportunity opp : deletedOpps ){
            if(opp.StageName == 'Closed Won' && opp.Account.Industry.equals('Banking') ){
                opp.addError('Cannot delete closed opportunity for a banking account that is won');
            }
        }
    }
}
*/


