({
    ///Remember to check on action.setParams("") the inside must equal the para in apex code on all reference. 
    //fuctnion not found usually somthing wrong with function like params 
    
    

    //consildate my createReferee and updateRerefee
    createReferee: function(component, referee){
        this.saveReferee(component, referee, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                var referees = component.get("v.referees");
                referees.push(response.getReturnValue());
                component.set("v.referees", referees);
            }
        });
    },
    updateReferee: function(component, referee){
        this.saveReferee(component, referee)
    },
    saveReferee: function(component, referee , callback){
        var action= component.get("c.saveReferee");
        action.setParams({
            "referee" : referee
        });
        if(callback){
            action.setCallback(this, callback);

        }
        $A.enqueueAction(action);
    },

})
