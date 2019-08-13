({//Rules
    // created Variable to hold  
    //get the component Id by component.get("")
    //do Set.component bye component.set("v") by findinf where to set
    //do init to format the 
    doInit : function(component, event, helper) {
        var mydate = component.get("v.referee.CreatedDate");
        if(mydate){
            component.set("v.formatdate", new Date(mydate));
        }


    },
})
