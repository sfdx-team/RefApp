/**
class SessionReferee

provides finder methods for accessing data in the in the Sesion Referee object
*/

public with sharing class SessionRefereeGateway {
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
    
     for (Session_Referee__c[] refs : [Select p.Id, Session__c From Session_Referee__c p where p.Id in : refIds])
		{	
			for (Session_Referee__c ref : refs)
			{
				if (ref.Session__c<> null)
				{
					inUseIds.add(ref.Id);
				}
			}
		}

      return inUseIds;
   }
}

