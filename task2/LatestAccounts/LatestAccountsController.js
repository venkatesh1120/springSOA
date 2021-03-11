({
    doinit : function(component, event, helper) {
        component.set("v.Spin",true);
        var columns = [{
            label		:	'Name',
            fieldName	:	'Id',
            type		:	'url',
            typeAttributes:{label:{fieldName:'Name'},target:'_blank'}
        },{
            label		:	'Phone',
            fieldName	:	'Phone',
            type		:	'Phone',
        },{
            label		:	'Website',
            fieldName	:	'Website',
            type		:	'url',
        },{
            label		:	'CreatedDate',
            fieldName	:	'CreatedDate',
            type		:	'text',
        }];
        component.set('v.AccounColumns', columns);
        var action=component.get("c.listOf10Accounts");
        action.setCallback(this,function(response){
            var state = response.getState();
            console.log('state'+state);                           
            if(state == 'SUCCESS'){
                var listOfRecords = response.getReturnValue();
                var toast = $A.get("e.force:showToast"); 
                if(listOfRecords == '' || listOfRecords == null){
                    toast.setParams({
                        "type" : "Warning",
                        "title" : "Warning",
                        "message" : "Something Went Wroong or no Accounts",
                        "mode" : "dismissible",
                        "duration":"5000",
                    });
                    component.set("v.Accountdata",null); 
                }
                else{
                    listOfRecords.forEach(function(rec){
                        rec.Id='/'+rec.Id;  
                    });
                    component.set("v.Accountdata",listOfRecords);   
                    toast.setParams({
                        "type" : "Success",
                        "title" : "Success",
                        "message" : "Success loaded Accounts",
                        "mode" : "dismissible",
                        "duration":"5000",
                    });
                } 
            }
            component.set("v.Spin",false);
            toast.fire();
        });
        
        $A.enqueueAction(action);
    }
})