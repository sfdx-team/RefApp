public with sharing class RefereesController {
    @AuraEnabled
    public static List<Referee__c> getReferees(){
        return [SELECT Id, First_Name__c,Last_Name__c, Email__c,Date_of_Last_Match_Officiated__c,  Certified_Referee__c, Last_Match_Officiated__c FROM Referee__c LIMIT 5];

    }
    @AuraEnabled
    public static Referee__c saveReferee(Referee__c referee){
        //perfor logic to check intege
        upsert referee;
        return referee;
        
    }
}
