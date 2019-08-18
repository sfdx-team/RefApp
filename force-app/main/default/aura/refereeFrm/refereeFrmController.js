({
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
