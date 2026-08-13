public class AccountHandler {
    public static Account insertNewAccount(String aname){
        try{
            Account acc = new Account(Name=aname);
            insert acc;
            return acc;
            }
        catch(DmlException e) {
            System.debug('a dml expection has occurred:'+e.getMessage());
            return null;
        }
    }
}