public with sharing class refereeHandler  implements ITrigger{
    //member varias(private) to hold the ids of Accounts 'in ued'
    
   // Member variable to hold the Id's of Accounts 'in use'
	private Set<Id> m_inUseIds = new Set<Id>();
	
	// Member variable to record Audit records
	private List<Audit__c> m_audits = new List<Audit__c>();


    
    //constructor
    public refereeHandler() {

    }
    /**
	 * bulkBefore
	 *
	 * This method is called prior to execution of a BEFORE trigger. Use this to cache
	 * any data required into maps prior execution of the trigger.
	 */
	public void bulkBefore()
	{
		// If this a delete trigger Cache a list of Account Id's that are 'in use'
		if (Trigger.isDelete)
		{
			// pre load all the in use projects passed to this trigger
			//AccountGatWay 'Way' is mistype 
			//m_inUseIds = AccountGateWay.findAccountIdsInUse(Trigger.oldMap.keySet());

			// pre load all id the in use projects passed to this Trigger
			m_inUseIds = RefereeGateway.findRefereeIdsInUse(Trigger.oldMap.keySet());
		}
	}
	
	public void bulkAfter()
	{}
		
	public void beforeInsert(SObject so)
	{}
	
	public void beforeUpdate(SObject oldSo, SObject so)
	{}
	
	/**
	 * beforeDelete
	 *
	 * This method is called iteratively for each record to be deleted during a BEFORE
	 * trigger.
	 */
	public void beforeDelete(SObject so)
	{	
		// Cast the SObject to an Referee
		Referee__c myReferee = (Referee__c)so;
		
		// Examine the Set and if the account is in use don't allow it to be deleted.	
		if (m_inUseIds.contains(myReferee.Id))
		{
			//Works only on records of Session_Referee__c, but I want to pop up warming that ref can not be delte because is refere '
			//I wasnt to implment that '
			
			// Add the error to the offending object
			so.addError('You cannot delete an Referee that is in use.' + myReferee.Id);
		}
		else
		{
			// Add an audit record to the list
			Audit__c myAudit = new Audit__c();
			myAudit.Description__c = 'Sessoin Name: ' + myReferee.Name + ' (Id: ' + myReferee.Id + ') was deleted by ';
			
			m_audits.add(myAudit);
		}
	}
	
	public void afterInsert(SObject so)
	{
	}
	
	public void afterUpdate(SObject oldSo, SObject so)
	{
	}
	
	public void afterDelete(SObject so)
	{
	}
	
	/**
	 * andFinally
	 *
	 * This method is called once all records have been processed by the trigger. Use this 
	 * method to accomplish any final operations such as creation or updates of other records.
	 */
	public void andFinally()
	{
		// insert any audit records
		if (!m_audits.isEmpty())
		{
			insert m_audits;
		}
	}



    
}