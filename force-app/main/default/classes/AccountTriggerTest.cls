@isTest
public class AccountTriggerTest {
    
    @isTest
    static void testCreateAccounts() {
        List<Account> accList = new List<Account>();
        
        for (Integer i = 0; i < 200; i++) {
            accList.add(new Account(
                Name = 'Test Account ' + i,
                BillingState = 'CA'
            ));
        }
        
        insert accList;
        
        List<Account> insertedAccounts = [
            SELECT ShippingState
            FROM Account
            WHERE BillingState = 'CA'
        ];
        
        for (Account acc : insertedAccounts) {
            System.assertEquals('CA', acc.ShippingState);
        }
    }
}