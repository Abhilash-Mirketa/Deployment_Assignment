public with sharing class OnDeveloperCreationHandler {
    public static void process(List<DeveloperG__c> devList){
        if(Schema.sObjectType.DeveloperG__c.fields.organization__c.isUpdateable()){
            Map<String, Schema.sObjectField> devFieldMap = Schema.sObjectType.DeveloperG__c.fields.getMap();
            System.debug(devFieldMap);
            if(devFieldMap.containsKey('Organization__c')){
                Schema.sObjectField org = devFieldMap.get('Organization__c');
                for(DeveloperG__c dev : devList){
                    if(dev.get(org) == null){
                     	dev.put(org, 'Mirketa');   
                    }
                }
            }
        }else{
            System.debug('Exception: Organization__c Field in DeveloperG__c Object is not editable!!!');
        }
    }
}