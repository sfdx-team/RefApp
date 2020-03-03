public without sharing class VisitsHelper {
    
      
      public static final String Segmentation='Visit_Detail__r.Segmentation__c';
      public static final String Target_Focus= 'Visit_Detail__r.Target_Focus__c';
      public static final String Event_BR = 'whatid';
      private static final String EVENT_TYPE='CompanyVisits';
      private static final List<String> Event_Fields = New List<String>{'id','Subject', 'Description', ' whatid', 'createdbyid', 'startDateTime', '	Account_Discussed__c'};
      private static final List<String> Account_Fields = New List<String>{'id', 'Name','BillingCity', 'BillingState'};
      private static final LIst<String> Contact_Fields = New LIst<String>{'Id','Name', 'User__c'};
      private static final List<String> Visit_Detail_Fields = New List<String>{'Segmentation__c', 'Focus__c'};

      private VisitsHelper() {//Rules
      }

      public static List<Contact> getContactbyUserId(set<Id> userIdSet){
        Boolean userchek;
        userchek = True;
        List<Contact> returnList = New LIst<Contact>();
        if(userchek && null != userIdSet){
          returnList = [SELECT Id, Name, User__c FROM Contact WHERE User__c IN: userIdSet];
          
        }
        else {
          throw new AuraHandledException('Dont Have Permission to view Detail');
        }
        return returnList;

      }

/*
  public static List<Event> getEventsByEventRel(List<EventRelation> eventRelList, Date startDate, Date endDate, String segmentation, string orderBy,set<id> userIdSet){
  set<Id> eventIdSet = new Set<Id>();
  for(EventRelation  thisEvent : eventRelList){
    eventIdSet.add(thisEvent.eventId);
  }
  return getEventsByTimeFrame(eventIdSet, startDate, endDate, segmentation, orderBy, userIdSet);
}
*/

/*
public static List<CoVisit> buildVisitEvent (set<id> userIdSet, Date startDate, Date endDate, String segment, string sortOrder){
  List<Contact> contactList = VisitsHelper.getContactbyUserId(userIdSet);
  List<Id> visitIds = new LIst<Id>();
  for(Event_Attendee_Record__c ear : [SELECT Id, 	Visit_Detail__c,  VisitDetailContact__c, Contact__c FROM Event_Attendee_Record__c WHERE Contact__c IN: contactList]){
    visitIds.add(ear.Visit_Detail__c);
  }
  system.System.debug('VisitDetail Size ' + visitIds.Size());
  userchek = True;
  Set<Id> AssociateEventIds = New set<Id>(New Map<Id,Event>([SELECT Id, Is_Primary__c, Visit_Detail__c FROM Event WHERE Is_Primary__c = True AND Visit_Detail__c IN: visitIds]).keySet());
  
}
  **/    

}
