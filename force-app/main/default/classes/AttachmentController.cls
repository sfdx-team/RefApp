
public with sharing class AttachmentController {
    
   @AuraEnabled
    public static void updatePicturePath(String recId){
        //In Lightning Experience, Attachments are stored in ContentDocuments
        ContentDocumentLink docLink;
         docLink = [ SELECT ContentDocumentId
                               FROM ContentDocumentLink
                               WHERE LinkedEntityId = :recId order by Id desc Limit 1];
        //ContentVersion Id uniquely identifies the attachment
		ContentVersion ver = [SELECT Id FROM ContentVersion Where ContentDocumentId = :docLink.ContentDocumentId];
        //Update the Picture_Path field with the url of the image
        Referee__c ref = [SELECT Id FROM Referee__c WHERE Id = :recId];
        ref.Picture_Path__c = '/sfc/servlet.shepherd/version/download/'+ ver.Id;
        upsert ref;
    }


}
