/**
class RefereeGateway

provides finder methods for accessing data in the Referee object
*/

public without sharing class RefereeGateway {
   /**
   Return a subject of Id's where there are any records in use

   Arguments:  Set<Id> refIds - Set of Referee Id's to examine

   Returns: Se<Id> - Set of Referee Id's that are 'in use' by Session Ids
   */
   public static set<Id> findRefereeIdsInUse(Set<Id> refIds)
   {
       //to add all id being use
       Set<Id> inUseIds = New Set<Id>(); 
       //session Id to be track to check if the Referesee has no session in place
        Set<Id> seIds = New Set<Id>();
     

    Session_Referee__c[] refses = [SELECT Referee__c, Session__c, Id, Name 
                               FROM Session_Referee__c];
   
   

    for( Session_Referee__c refse : refses)
    {
        seIds.add(refse.Session__c);
        if(seIds.size()> 0 ){
            inUseIds.add(refse.Id);
        }
    }

       
      
   }
   
}
