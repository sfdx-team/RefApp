({//Step to load data
        //defin function
        //set var and call component.get(c.apex method)
        // set callback action with anonymous runction(response)
        //set varialbe to received response state 
        //A.enquestAction 
        
            //move click created to isolate components
            //hanldeUpdate referee
            handleUpdateReferee : function(component, event, helper){
                var updateRef = event.getParam("referee");
                helper.updateReferee(component, updateRef);

            },
            handleCreateReferee: function(component, event, helper){
                var newReferee = event.getParam("referee");
                helper.createReferee(component, newReferee);
            },
            
            doInit: function(component, event, helper){
                //create the action
                var action= component.get("c.getReferees");
                // Add callback behavior fro when response is reive
                action.setCallback(this, function(response){
                    var state = response.getState();
                    if(state === "SUCCESS"){
                        component.set("v.referees", response.getReturnValue());
                    }
                    else {
                        console.log("Failed with state:" + state);
                    }
                });
                //Send action off to be execute asynchournous 
                $A.enqueueAction(action);
        
            },
            
})


