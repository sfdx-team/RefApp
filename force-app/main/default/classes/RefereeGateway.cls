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
    // Retrieve SessionReferee object if they exist
     for (Referee__c[] refs : [Select p.Id,( Select Id From Session_Referees__r LIMIT 1) FROM Referee__c p Where p.Id IN : refIds])
		{	
			for (Referee__c ref : refs)
			{
				if (ref.Session_Referees__r.size()> 0)
				{
					inUseIds.add(ref.Id);
				}
			}
		}

      return inUseIds;
   }
   
}
