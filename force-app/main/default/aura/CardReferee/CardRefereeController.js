({//Step to load data
        //defin function
        //set var and call component.get(c.apex method)
        // set callback action with anonymous runction(response)
        //set varialbe to received response state 
        //A.enquestAction 
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
            //Step sfor created controller
            //set var to get array of reference input the requiered validation
            //js reduce() fucntion
            //validSoFar captures from reduce
            //inputCmp.get('v.validity').valid
            //inputCmp.showHelpMessageIfInvalid 
            // which can customized with messageWhenRangeUnderflow
            clickCreate: function(component, event, helper) {
                var validReferee = component.find('refereeform').reduce(function (validSoFar, inputCmp) {
                    // Displays error messages for invalid fields
                    inputCmp.showHelpMessageIfInvalid();
                    return validSoFar && inputCmp.get('v.validity').valid;
                }, true);
                // If we pass error checking, do some real work
                if(validReferee){
                    // Create the new expense
                    var newReferee = component.get("v.newReferee");
                    console.log("Create Referee: " + JSON.stringify(newReferee));
                    helper.createReferee(component, newReferee);
                }
            },
            
            

           

})


