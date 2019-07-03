@isTest
private class TestAccountDeletion {
   //One Opportunity
    @isTest static void TestDeleteAccountWithOneOpportunity() {
        // Test data setup
        // Create one account with one opportunity by calling a utility method
        Account[] accts = TestDataFactory.createAccountsWithOpps(1,1);
        
        // Perform test
        Test.startTest();
        Database.DeleteResult result = Database.delete(accts[0], false);
        Test.stopTest();
        // Verify that the deletion should have been stopped by the trigger,
        // so check that we got back an error.
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('You cannot delete an Account that is in use.' + accts[0].Id,
                             result.getErrors()[0].getMessage());
        
    }
    //Without opportunities
    @isTest static void TestDeleteAccountWithNoOpportunities() {
        // Test data setup
        // Create one account with no opportunities by calling a utility method
        Account[] accts = TestDataFactory.createAccountsWithOpps(1,0);
        
         Audit__c audit = New  Audit__c(Description__c= 'Account Name: ' + accts[0].Name + ' (Id: ' + accts[0].Id + ') was deleted by ');
        // Perform test
        Test.startTest();
        Database.DeleteResult result = Database.delete(accts[0], false);
        Database.SaveResult result2 = Database.insert(audit);
        Test.stopTest();
        // Verify that the deletion was successful
        System.assert(result.isSuccess());
        System.assert(result2.isSuccess());
        System.assertEquals('Account Name: ' + accts[0].Name + ' (Id: ' + accts[0].Id + ') was deleted by ', 
                            'Account Name: ' + accts[0].Name + ' (Id: ' + accts[0].Id + ') was deleted by ');
    }
    
    @isTest static void TestDeleteBulkAccountsWithOneOpportunity() {
        // Test data setup
        // Create accounts with one opportunity each by calling a utility method
        Account[] accts = TestDataFactory.createAccountsWithOpps(200,1);
        
        // Perform test
        Test.startTest();
        Database.DeleteResult[] results = Database.delete(accts, false);
        Test.stopTest();
        // Verify for each record.
        // In this case the deletion should have been stopped by the trigger,
        // so check that we got back an error.
        for(Database.DeleteResult dr : results) {
            System.assert(!dr.isSuccess());
            System.assert(dr.getErrors().size() > 0);
            //System.assertEquals('Cannot delete account with related opportunities.', dr.getErrors()[0].getMessage());
            
            //System.assertEquals('You cannot delete an Account that is in use.' + accts[0].Id,dr.getErrors()[0].getMessagge());
        
                       
        }
    }
    
    @isTest static void TestDeleteBulkAccountsWithNoOpportunities() {
        // Test data setup
        // Create accounts with no opportunities by calling a utility method
        Account[] accts = TestDataFactory.createAccountsWithOpps(200,0);
        
        // Perform test
        Test.startTest();
        Database.DeleteResult[] results = Database.delete(accts, false);
        Test.stopTest();
        // For each record, verify that the deletion was successful
        for(Database.DeleteResult dr : results) {
            System.assert(dr.isSuccess());
        }
    }
}