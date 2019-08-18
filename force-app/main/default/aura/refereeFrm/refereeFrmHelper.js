({
    createReferee: function(component, newReferee) {
        var createEvent = component.getEvent("createReferee");
        createEvent.setParams({ 
            "referee": newReferee 
        });
        createEvent.fire();
    },

})

