({//Rules
    // created Variable to hold  
    //get the component Id by component.get("")
    //do Set.component bye component.set("v") by findinf where to set
    //do init to format the 
    doInit : function(component, event, helper) {
        var mydate = component.get("v.referee.Date_of_Last_Match_Officiated__c");
        if(mydate){
            component.set("v.formatdate", new Date(mydate));
        }


    },
    clickCertified: function(component, event, helper){
        var referee = component.get("v.referee");
        var updateEvent = component.getEvent("updateReferee");
        updateEvent.setParams({
            "referee" : referee
        });
        updateEvent.fire();
    },
})
