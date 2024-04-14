public with sharing class OppAmountValidation {
    public static void opportunityAmountHandler(List<Opportunity> updatedOpps){
        List<Opportunity> oppsToBeUpdated = new List<Opportunity>();
        for(Opportunity opp : updatedOpps ){
            if(opp.Amount <= 5000){
                opp.addError('Opportunity amount must be greater than 5000');
            }
            else {
                oppsToBeUpdated.add(opp);
            }
        }
    }
}