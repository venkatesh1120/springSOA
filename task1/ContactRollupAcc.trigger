trigger ContactRollupAcc on Contact (after insert,after update,after delete) {
    
    ContactCountRollupClass.newListCon = Trigger.New;
    ContactCountRollupClass.oldListCon = Trigger.Old;
    
    if(Trigger.isAfter && Trigger.Isinsert)
    {
        ContactCountRollupClass.rollup();
    }
     if(Trigger.isAfter && Trigger.Isupdate)
    {
        ContactCountRollupClass.rollup();
    }
    if(Trigger.isAfter && Trigger.IsDelete)
    {
        ContactCountRollupClass.rollupdel();
    }
    
}