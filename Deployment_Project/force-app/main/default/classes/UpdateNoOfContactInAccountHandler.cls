public with sharing class UpdateNoOfContactInAccountHandler {
    public static void startProcess(Boolean isIns, Boolean isDel, List<Contact> conListNew, List<Contact> conListOld){
        List<Account> toBeUpd = new List<Account>();
        Set<Id> accIdSet = new Set<Id>();
        if(isIns){
            for(Contact con : conListNew){
                accIdSet.add(con.AccountId);
            }
        }
        if(isDel){
            for(Contact con : conListOld){
                accIdSet.add(con.AccountId);
            }
        }
        for(Id accId : accIdSet){
            List<Contact> trackCon = [SELECT Id FROM CONTACT WHERE AccountId = :accId];
            Integer conCount = trackCon.size();
            if(conCount == null){
                conCount = 0;
            }
            System.debug(conCount);
            toBeUpd.add(new Account(Id = accId, Number_Of_Contact__c = (Integer)conCount));
        }
        if(!toBeUpd.isEmpty()){
            Database.Update(toBeUpd, true);
        }
    }
}