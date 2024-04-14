public with sharing class AccountFieldsSet {
    public static void handleInsert(List<Account> newAccounts){
        List<Account> accountsToBeInserted = new List<Account>();
        for (Account acc : newAccounts){
            if (acc.Type == null) {
                acc.Type = 'Prospect';
                accountsToBeInserted.add(acc);
            }

            if (acc.ShippingStreet != null || acc.ShippingCity != null || acc.ShippingState != null || acc.ShippingPostalCode != null || acc.ShippingCountry != null) {
                acc.BillingStreet = acc.ShippingStreet;
                acc.BillingCity = acc.ShippingCity;
                acc.BillingState = acc.ShippingState;
                acc.BillingPostalCode = acc.ShippingPostalCode;
                acc.BillingCountry = acc.ShippingCountry;
                accountsToBeInserted.add(acc);
            }

            if (acc.Phone != null && acc.Website != null && acc.Fax != null) {
                acc.Rating = 'Hot';
                accountsToBeInserted.add(acc);
            }
        }
    }
}
