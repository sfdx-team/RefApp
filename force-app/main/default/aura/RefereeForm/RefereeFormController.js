({
    onSuccess: function(component,event,helper){
        //Show Success message on upsertion of record
        var resultToast = $A.get("e.force:showToast");
        resultToast.setParams({
                            "title": "Success!",
                            "message": "Referee upsert Saved Successfully"
                        });
        resultToast.fire();
        //Navigate to sObject home page
        var homeEvent = $A.get("e.force:navigateToObjectHome");
    	homeEvent.setParams({
        	"scope": "Referee__c"
    	});
    	homeEvent.fire();
    },
    showToast : function(component, event, helper) {
        //show something
    var toastEvent = $A.get("e.force:showToast");
    toastEvent.setParams({
        "title": "Success!",
        "message": "The Referee record has been updated successfully."
    });
    toastEvent.fire();
}
})