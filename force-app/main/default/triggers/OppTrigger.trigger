trigger OppTrigger on Opportunity (before insert, before update, before delete) {
    if(Trigger.isBefore){
        if(Trigger.isUpdate){
            OppAmountValidation.opportunityAmountHandler(Trigger.new);
            SetPrimaryContactToOpp.setPrimaryContactOnAccToOpp(Trigger.new);
        }
        if(Trigger.isDelete){
            OppClosedWonDeletionValidation.oppsToBeDeleted(Trigger.old);
        }
        }
        }