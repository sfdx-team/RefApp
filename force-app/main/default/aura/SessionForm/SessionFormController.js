({
    onSuccess : function(component, event, helper) {
        //show succes message on upsertion of record
        var resultToast = $A.get("e.force:showToast");
        resultToast.setParams({
            "title" : "Success",
            "message" : "Session Record Saved Successfully"
        });
        resultToast.fire();
        //navigate to object homepage
        var homeEvent = $A.get("e.force:navigateToObjectHome");
        homeEvent.setParams({
            "scope" : "Session__c"
        });
        homeEvent.fire();

    }
})
