({
    ///Remember to check on action.setParams("") the inside must equal the para in apex code on all reference. 
    //fuctnion not found usually somthing wrong with function like params 
    createReferee: function(component, referee) {
        var action = component.get("c.saveReferee");
        action.setParams({
            "referee": referee
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var referees = component.get("v.referees");
                referees.push(response.getReturnValue());
                component.set("v.referees", referees);
            }
        });
        $A.enqueueAction(action);
    },
})
