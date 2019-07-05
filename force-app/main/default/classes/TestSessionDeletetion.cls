@isTest
private class TestSessionDeletetion {
   @isTest static void TestDeleteRefereeWithOneSession(){
       //Test Data Setup
       //Created a Referee and and a Session , and add the session id and ref id
       Referee__c ref = New Referee__c(First_Name__c = 'Test ref');
       insert ref;
       Session__c session = New Session__c(Name = ' Test session');
       insert session;
       Session_Referee__c  session_ref = New Session_Referee__c(Session__c = session.Id, Referee__c=ref.Id);
       insert session_ref;

       Test.startTest();

       Database.DeleteResult dr = Database.delete(ref, false);

       Test.stopTest();
       
       System.assert(!dr.isSuccess());
       System.assert(dr.getErrors().size()> 0);
       System.assertEquals('You cannot delete refereee with session version2.'+ ref.Id, dr.getErrors()[0].getMessage());

       
   }

   @isTest static void TestDeleteRefereeWithoutSessions() {
       Referee__c ref = New Referee__c(First_Name__c = 'Test wihout session');
       insert ref;

       Audit__c audit = New Audit__c(Description__c = 'Test audit');

       Test.startTest();
       Database.DeleteResult dr = Database.delete(ref);
       Database.SaveResult sr = Database.insert(audit);
       Test.stopTest();

       System.assert(dr.isSuccess());
       System.assert(sr.isSuccess());

   }
}
