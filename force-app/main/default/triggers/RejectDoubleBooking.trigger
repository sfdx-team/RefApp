trigger RejectDoubleBooking on Session_Referee__c (before insert, before update) {
    //collect ID's to reduce data calls
    List<Id> speakerIds = new List<Id>();
    Map<Id,DateTime> requested_bookings = new Map<Id,DateTime>();
    //get all speakers related to the trigger
    //set booking map with ids to fill later
    //Use put for map and add for list
    for(Session_Referee__c newItem : trigger.new) {
        requested_bookings.put(newItem.Session__c,null);
        speakerIds.add(newItem.Referee__c);
    }
    //fill out the start date/time for the related sessions
    List<Session__c> related_sessions = [SELECT ID, Session_Date__c from Session__c WHERE ID IN :requested_bookings.keySet()];
    for(Session__c related_session : related_sessions) {
        requested_bookings.put(related_session.Id,related_session.Session_Date__c);
    }
    //get related speaker sessions to check against
    List<Session_Referee__c> related_speakers = [SELECT ID, Referee__c, Session__c, Session__r.Session_Date__c from Session_Referee__c WHERE Referee__c IN :speakerIds];
    //check one list against the other
    for(Session_Referee__c requested_session_speaker : trigger.new) {
        DateTime booking_time = requested_bookings.get(requested_session_speaker.Session__c);
        for(Session_Referee__c related_speaker : related_speakers) {
            if(related_speaker.Referee__c == requested_session_speaker.Referee__c &&
               related_speaker.Session__r.Session_Date__c == booking_time) {
                   requested_session_speaker.addError('The speaker is already booked at that time');
            }
        }
    }
}