trigger AccountTrigger on Account (before Insert, after Insert) {
    if(Trigger.isBefore) {
        if(Trigger.isInsert) {
            AccountFieldsSet.handleInsert(Trigger.new);
        }
    }
    if(Trigger.isAfter) {
        if(Trigger.isInsert) {
            ContactCreationOnAccount.contactCreation(Trigger.new);
        }
    }
}