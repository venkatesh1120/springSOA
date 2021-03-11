public class listOfAccts {
    @auraEnabled
    public static list<Account> listOf10Accounts(){
        return [select id,name,Phone,Website,CreatedDate from Account ORDER BY CreatedDate DESC limit 10];
    }

}