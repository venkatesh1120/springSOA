public class ContactCountRollupClass {
    public static list<Contact> newListCon = new list<Contact>();
    public static list<Contact> oldListCon = new list<Contact>();
    public static void rollup(){
        set<id> AccId = new set<id>();
        for(Contact Con: newListCon ){
            if(con.AccountId != null ){
                AccId.add(Con.AccountId);
            }
        }
        if(!AccId.isEmpty()){
           updateAccount(AccId); 
            system.debug('AccId>>>'+AccId);
        }
    }
    public static void rollupdel(){
        set<id> AccId = new set<id>();
        for(Contact Con: oldListCon ){
            if(con.AccountId != null ){
                AccId.add(Con.AccountId);
            }
        }
        if(!AccId.isEmpty()){
           updateAccount(AccId); 
            system.debug('AccId>>>'+AccId);
        }
    }
    public static void updateAccount(set<id> AccId){
       integer count =[SELECT COUNT() FROM Contact WHERE AccountId=:Accid];
        list<Account> AccList =[SELECT id,Name,Number_of_Contacts__c  FROM Account WHERE id=:Accid];
        list<Account> tempList = new list<Account>();
        if(count > 0){
            for(Account ac:AccList){
                ac.Number_of_Contacts__c = count;
                tempList.add(ac);
            }
        }
        if(!tempList.isEmpty()){
           Database.update(tempList, false); 
        }
        
    }
}