/**
 * Datasetup Created Referees and Sessions to have records. 
 * 
 * Notes
 * Created a Map to populate it with all the session id, to input to refs
 * Similar to the Certification with passed/fail method
 * */
public class DataSetup {
      public static List<Referee__c> createRefereeWithSessions(Integer numRefs, Integer numSessions){
        List<Referee__c> refs = New List<Referee__c>();
        List<Session__c> sessions = New List<Session__c>();
        List<Session_Referee__c> sessionRefs = New List<Session_Referee__c>();
        //refs/
        //THis crateds a refs with number of sessionss for each . ref 
		
//refs
 for(Integer i = 0; i< numRefs; i++){
            Referee__c r = New Referee__c(First_Name__c = ' Test Ref' + i );
            refs.add(r);
        }
        insert refs;
       //session
        for(Integer k = 0; k<numSessions; k++){
            sessions.add(New Session__c(Name = ' Test Session'+ k ));

        }
          
        insert sessions;
  	//session refs
      //for each ref add this many sessions
	    for(Integer j = 0; j< numRefs; j++){
        Referee__c ref = refs[j];
       
        for(Integer l = 0; l<numSessions; l++){
            
           sessionRefs.add(New Session_Referee__c(Referee__c= ref.Id, Session__c =sessions[l].Id )); // must session[l] to track sessions
        }
	}
	insert sessionRefs;

    return refs;
    }
}