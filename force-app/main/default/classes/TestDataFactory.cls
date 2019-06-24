public class TestDataFactory {

    public static List<Account> CreateAccountsWithOpps(Integer num_accts, Integer num_oppsPerAcct) {
        //holds a ccount of list
        List<Account> accts = New List<Account>();
        
        for(Integer i= 0; i<num_accts; i++){
            Account a = New Account(Name='TestAccount'+i);
            accts.add(a);
        }
        
        //insert contacts using a diffrent approach
        insert accts;
        
        List<Opportunity> opps = New List<Opportunity>();
        for(Integer j= 0; j<num_accts; j++){
            Account acct = accts[j];
            //for each account just insert, add opportunities
            for(Integer k=0; k<num_oppsPerAcct; k++){
                Opportunity opp = New Opportunity(Name= acct.Name + 'Opportunity',
                                                 StageName = 'Prospect',
                                                 CloseDate = System.today(),
                                                 AccountId = acct.Id);
                opps.add(opp);
                
            }
        }
        //insert all opportunties for all accounts 
        //is it, possible to add 2 opportunities insteat of one ?
        insert opps;
        return accts;
        
    }
}