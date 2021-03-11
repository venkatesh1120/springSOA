public class CountConCtrl {
    
    public String currRecordId {get;set;}
    public CountConCtrl(ApexPages.StandardController controller) 
    {
        currRecordId  = ApexPages.CurrentPage().getparameters().get('id');
        system.debug('currRecordId>>>>'+currRecordId);
        
    }
    public PageReference rollupInProg(){
    
		integer count =[SELECT COUNT() FROM Contact WHERE AccountId=:currRecordId];        
        list<Account> AccList =[SELECT id,Name,Number_of_Contacts__c  FROM Account WHERE id=:currRecordId];
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
      PageReference p = new PageReference('/'+currRecordId);
            p.setRedirect(true);
            return p;
    }

}