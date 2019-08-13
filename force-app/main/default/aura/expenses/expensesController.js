({
// hhandle click create
    
    ///handle the reimburse update
    handleUpdateExpense: function(component, event, helper) {
        var updatedExp = event.getParam("expense");
        helper.updateExpense(component, updatedExp);
    },


    //creatd Expense event from the handler on the cmp
    handleCreateExpense: function(component, event, helper) {
        var newExpense = event.getParam("expense");
        helper.createExpense(component, newExpense);
    },

    
    //Load expenses from salesforce
    doInit: function(component, event, helper){
        //create the action
        var action= component.get("c.getExpenses");
        // Add callback behavior fro when response is reive
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                component.set("v.expenses", response.getReturnValue());
            }
            else {
                console.log("Failed with state:" + state);
            }
        });
        //Send action off to be execute asynchournous 
        $A.enqueueAction(action);

    }


})


