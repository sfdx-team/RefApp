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
    static testmethod void TestDoubleBooking() {
    Datetime now = System.now();
    Referee__c referee = new Referee__c(First_Name__c='John', Last_Name__c='Smith');
    insert referee;
    Session__c session1 = new Session__c(Name='Session 1', Session_Date__c=now);
    insert session1;
    Session__c session2 = new Session__c(Name='Session 2', Session_Date__c=now);
    insert session2;
    Session_Referee__c assignment1 =
    new Session_Referee__c(Session__c=session1.Id, Referee__c=referee.Id);
    insert assignment1;
    Session_Referee__c assignment2 =
    new Session_Referee__c(Session__c=session2.Id, Referee__c=referee.Id);
    Database.SaveResult result = Database.insert(assignment2, false);
    System.assert(!result.isSuccess());
}


}