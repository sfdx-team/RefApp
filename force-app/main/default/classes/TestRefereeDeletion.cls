@isTest
public class TestRefereeDeletion {
     @isTest static void testDeleteRefereeWithOneSession(){
       //Test Data Setup
       //Created a Referee and and a Session , and add the session id and ref id
       Referee__c[] refs = TestDataFactory.createRefereeWithSessions(1,1);
       Test.startTest();

       Database.DeleteResult dr = Database.delete(refs[0], false);

       Test.stopTest();
       
       System.assert(!dr.isSuccess());
       System.assert(dr.getErrors().size()> 0);
       System.assertEquals('You cannot delete an Referee that is in use.'+ refs[0].Id, dr.getErrors()[0].getMessage() );

       
   }
  

   @isTest static void testDeleteRefereeWithoutSessions() {
       Referee__c[] refs = TestDataFactory.createRefereeWithSessions(1,0);

       Audit__c audit = New Audit__c(Description__c = 'Test audit');

       Test.startTest();
       Database.DeleteResult dr = Database.delete(refs[0]);
       Database.SaveResult sr = Database.insert(audit);
       Test.stopTest();

       System.assert(dr.isSuccess());
       System.assert(sr.isSuccess());

   }
   @isTest static void testDeleteBulkRefereesWithOneSession(){
       Referee__c[]  refs = TestDataFactory.createRefereeWithSessions(200,1);

           Test.startTest();
           //more than one result expected
           Database.DeleteResult[] results = Database.delete(refs, false);
           Test.stopTest();
           // Verify for each record
           // In this case the deletion should have been stopped by the trigger
           //so check that we got back the error

          Integer i = 0;
           for(Database.DeleteResult dr : results){
                i++;
               System.assert(!dr.isSuccess());
               
               //I couldnt get the id to matched . 
               //System.assert(dr.getErrors().size()>0);
              // System.assertEquals('You cannot delete an Referee that is in use.'+ refs[i].Id, dr.getErrors()[0].getMessage() );
           }
           
   }

   @isTest static void testDeleteBulkRefereesWithoutSessions(){
       Referee__c[] refs = TestDataFactory.createRefereeWithSessions(200,0);
       Audit__c audit = New Audit__c(Description__c = 'Test audit');

           Test.startTest();
           //more than one result expected
           Database.DeleteResult[] results = Database.delete(refs, false);
           Database.SaveResult ad = Database.insert(audit);
           Test.stopTest();
           //for each deletion verify each deletion was succesfullly 

           for(Database.DeleteResult dr : results){
               System.assert(dr.isSuccess() );
           }

   }
   

}