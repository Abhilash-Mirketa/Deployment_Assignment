public with sharing class TriggerOnAccountCreationHandler {
    public static void startProcess(List<Account> accIdList){
        //Schema.DescribeSObjectResult drSObj =  Schema.sObjectType.Opportunity;
        if(Schema.sObjectType.Opportunity.isCreateable()){
            List<Opportunity> oppListIn = new List<Opportunity>();
            for(Account acc : accIdList){
                oppListIn.add(new Opportunity(Name = acc.name, stageName = 'Prospecting', CloseDate = Date.newInstance(2024,05,13), AccountId = acc.Id));
            }
            Database.Insert(oppListIn, true, AccessLevel.USER_MODE);
        }
    }
}