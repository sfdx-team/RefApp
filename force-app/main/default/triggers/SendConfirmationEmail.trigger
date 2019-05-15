trigger SendConfirmationEmail on Session_Referee__c (after insert) {
     List<Id> sessionRefereeIds = new List<Id>();
    for(Session_Referee__c newItem : trigger.new) {
        sessionRefereeIds.add(newItem.Id);
    }
    // Retrieve session name and time + ref name and email address related to ID's
    // Retrieves only if speaker has email address
    List<Session_Referee__c> sessionReferees =
            [SELECT Session__r.Name,
                    Session__r.Session_Date__c,
                    Referee__r.First_Name__c,
                    Referee__r.Last_Name__c,
                    Referee__r.Email__c
             FROM Session_Referee__c WHERE Id IN :sessionRefereeIds
             AND Referee__r.Email__c <> NULL];
    if(sessionReferees.size() > 0) {
            // Send confirmation email
        String[] addresses = new String[]{},
            	 subjects = new String[]{},
                 messages = new String[]{};
        for(Session_Referee__c sessionReferee: sessionReferees)	{
            addresses.add(sessionReferee.Referee__r.Email__c);
            subjects.add('Referee Session Confirmation');
            messages.add('Dear ' + sessionReferee.Referee__r.First_Name__c +
                    ',\nYour session "' + sessionReferee.Session__r.Name + '" on ' +
                    sessionReferee.Session__r.Session_Date__c + ' is confirmed.\n\n' +
                    'Thanks for officiating the game Good luck!');
        }
        EmailManager.sendMail(addresses, subjects, messages);


    }

}