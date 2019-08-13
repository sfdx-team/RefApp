({
/**
 *  createExpense: function(component, expense) {
        var action = component.get("c.saveExpense");
        action.setParams({
            "expense": expense
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var expenses = component.get("v.expenses");
                expenses.push(response.getReturnValue());
                component.set("v.expenses", expenses);
            }
        });
        $A.enqueueAction(action);
    },
    updateExpense: function(component, expense){
        var action = component.get("c.saveExpense");
        action.setParams({
            "expense": expense

        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if( state == "SUCCESS") {
                //DO 
            }
        });
        $A.enqueueAction(action);
    },
 *  */  
createExpense: function(component, expense) {
    this.saveExpense(component, expense, function(response){
        var state = response.getState();
        if (state === "SUCCESS") {
            var expenses = component.get("v.expenses");
            expenses.push(response.getReturnValue());
            component.set("v.expenses", expenses);
        }
    });
},
updateExpense: function(component, expense) {
    this.saveExpense(component, expense);
},

//general function to handle function

saveExpense: function(component, expense, callback) {
    var action = component.get("c.saveExpense");
    action.setParams({
        "expense": expense
    });
    if (callback) {
        action.setCallback(this, callback);
    }
    $A.enqueueAction(action);
},

})
