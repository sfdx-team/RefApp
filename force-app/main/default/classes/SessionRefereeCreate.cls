public class SessionRefereeCreate {
    /*
     * Enter Name to Indentify session and referee name along number of accounts to created
     * 
     */
    public static void Create(String Name, Integer numberOfRefs){
        //ref creation
        List<Referee__c> refs = New List<Referee__c>();
        List<Session__c> sessList = New List<Session__c>();
        for (Integer i=0; i< numberOfRefs; i++){
            Referee__c ref = New Referee__c();
    		ref.First_Name__c = Name + i;
    		ref.Last_Name__c  = 'Alvararez' + i;
    		ref.Email__c      = 'pa@email.com' + i;
   			ref.Bio__c  	= 'Back from the dead' + i;
            Session__c sess = New Session__c();
            sess.Name = Name + 'Sunny Sunday'+ i ;
            
            //sess
            sessList.add(sess);
            //refs
    		refs.add(ref); 
        }
       
        /**
         * 
         * TODO 
         * Relate Sessiona and referee when I created them. 
         * Just to test my skills 
         */
        
       
        
        
    }
      
}