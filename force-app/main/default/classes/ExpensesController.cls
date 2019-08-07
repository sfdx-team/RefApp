public with sharing class ExpensesController {
    // STERN LECTURE ABOUT WHAT'S MISSING HERE COMING SOON
    @AuraEnabled
    public static List<Expense__c> getExpenses() {
        
        // Check to make sure all fields are accessible to this user
        
        
        // OK, they're cool, let 'em through
        return [SELECT Id, Name, Amount__c, Client__c, Date_Of_Purchase__c, 
                       Reimbursed__c, CreatedDate 
                FROM Expense__c];
    }
    @AuraEnabled
    public static Expense__c saveExpense(Expense__c expense) {
        // Perform isUpdateable() checking first, then
        upsert expense;
        return expense;
    }
}