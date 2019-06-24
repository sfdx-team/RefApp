@isTest
public class TestRejectBooking {
    
    @isTest static void TestingSingleBooking(){
        Datetime now = System.now();
        Referee__c referee = New Referee__c(First_Name__c='John',
                                           Last_Name__c='smith');
        insert referee;
        
        Session__c session = New Session__c(Name='Some session', 
                                           Session_Date__c=now);
        insert session;
        Session_Referee__c assigment = New Session_Referee__c(Session__c = session.Id,
                                                             Referee__c = referee.Id);
        Database.SaveResult result = Database.insert(assigment, false);
        System.assert(result.isSuccess());
    }

}