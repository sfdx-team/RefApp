trigger RejectDoubleBooking on Session_Referee__c (before insert, before update) {
    //collect ID's to reduce data calls
    /** TODO
    bulkify code and move business logic to classes, to avoid reaching governor limits
    */


    List<Id> refereeIds  = new List<Id>();
    //map to store id and date time
    Map<Id,DateTime> requested_bookings = new Map<Id,DateTime>();
    //get all speakers related to the trigger
    //set booking map with ids to fill later
    //Use put for map and add for list
    for(Session_Referee__c newItem : trigger.new) {
        //Started and add Session 
        requested_bookings.put(newItem.Session__c,null);
        System.debug('from trigger new' + newItem.Session__c);
        refereeIds.add(newItem.Referee__c);
    }
    //fill out the start date/time for the related session
    List<Session__c> related_sessions = [SELECT ID, Session_Date__c from Session__c WHERE ID IN :requested_bookings.keySet()];
    for(Session__c related_session : related_sessions) {
        requested_bookings.put(related_session.Id, related_session.Session_Date__c);
    }
    //get related referee sessions to check against
    List<Session_Referee__c> related_referees = [SELECT ID, Referee__c, Session__c, Session__r.Session_Date__c from Session_Referee__c 
    WHERE Referee__c IN :refereeIds];
    //check one list against the other
    for(Session_Referee__c requested_session_referee : trigger.new) {
        DateTime booking_time = requested_bookings.get(requested_session_referee.Session__c);
        for(Session_Referee__c related_referee : related_referees) {
            if(related_referee.Referee__c == requested_session_referee.Referee__c &&
               related_referee.Session__r.Session_Date__c == booking_time) {
                   requested_session_referee.addError('The referee is already booked to officiate a game at that time');
            }
        }
    }
}