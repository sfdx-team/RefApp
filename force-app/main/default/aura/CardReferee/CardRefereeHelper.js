({
    
    createExpense: function(component, expense) {
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
       
})
