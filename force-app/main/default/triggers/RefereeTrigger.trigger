trigger RefereeTrigger on Referee__c (after delete, after insert, after update, before delete, before insert, before update) {

TriggerFactory.createHandler(Session_Referee__c.sObjectType);
}