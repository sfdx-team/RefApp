@isTest
public class TestRefereeDataFactory {

    public static List<Referee__c> createRefereeWithSessions(Integer num_refs, Integer num_sessions){
        List<Referee__c> refs = New List<Referee__c>();

        for(Integer i = 0; i< num_refs; i++){
            Referee__c r = New Referee__c(First_Name__c = ' Test Ref');
            refs.add(r);

        }
        insert refs;
        List<Session_Referee__c> session_refs = New List<Session_Referee__c>();

        List<Session__c> sessions = New List<Session__c>();
        for(Integer j= 0; j<num_refs; j++){
            Referee__c ref = refs[j];
            // for each Ref just inserted, add Sessions
            for(Integer k = 0; k< num_sessions; k++){
                sessions.add(New Session__c(Name = ' Test Session'+k ));
                Session_Referee__c sr = New Session_Referee__c();
                sr.Referee__c = refs[j].id;
                sr.Session__c = sessions[k].id;

            }
            insert sessions;

        }
        return refs;
        

    }
    
   
    }
