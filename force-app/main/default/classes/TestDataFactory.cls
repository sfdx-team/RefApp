public class TestDataFactory {

    public static List<Account> CreateAccountsWithOpps(Integer num_accts, Integer num_oppsPerAcct) {
        //holds a ccount of list
        List<Account> accts = New List<Account>();
        
        for(Integer i= 0; i<num_accts; i++){
            Account a = New Account(Name='TestAccount'+i);
            accts.add(a);
        }
        
        //insert contacts using a diffrent approach
        insert accts;
        
        List<Opportunity> opps = New List<Opportunity>();
        for(Integer j= 0; j<num_accts; j++){
            Account acct = accts[j];
            //for each account just insert, add opportunities
            for(Integer k=0; k<num_oppsPerAcct; k++){
                Opportunity opp = New Opportunity(Name= acct.Name + 'Opportunity',
                                                 StageName = 'Prospect',
                                                 CloseDate = System.today(),
                                                 AccountId = acct.Id);
                opps.add(opp);
                
            }
        }
        //insert all opportunties for all accounts 
        //is it, possible to add 2 opportunities insteat of one ?
        insert opps;
        return accts;
        
    }
    
    /* Referee data setupt 

    */
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
      //for each ref add this amound of sessions
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