public class AccountListViewController {
    @AuraEnabled
    public static String loadAccounts() {
        List<Account> accountList = [SELECT Id, Name, AccountNumber, Phone, Website FROM Account];
        
        return JSON.serialize(accountList);
    }
    
    @AuraEnabled
    public static String updateAccount(String jsonString) {
        Account acc = (Account)JSON.deserialize(jsonString, Account.class);
        
        update acc;
        
        return 'Success';
    }
}