public class DataSetup {

     public static void createRefereeWithSessions(Integer num_refs, Integer num_sessions){
        
        
    List<Referee__c> refs = New List<Referee__c>();
    List<Session__c> sessions = New List<Session__c>();
    List<Session_Referee__c> session_refs = New List<Session_Referee__c>();
        //refs
			for(Integer i = 0; i< 10; i++){
            Referee__c r = New Referee__c(First_Name__c = ' Test Ref' + i );
            refs.add(r);
        }
        insert refs;
       //session
        for(Integer k = 0; k<10; k++){
            sessions.add(New Session__c(Name = ' Test Session'+k ));

        }
        insert sessions;
	
        //A ref can have 1o session 
        //A Session can have 10 Refs convering the event:wq
        

    }

}