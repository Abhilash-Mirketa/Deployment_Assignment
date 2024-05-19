public with sharing class DynamicQueryWrapper {
    public static List<Id> queryRecords(String objName, List<WrapCondition> conditions){
        String query = 'SELECT Id FROM ' + objName + ' WHERE';
        Map<String, Object> bindVariables = new Map<String, Object>();
        for(Integer i = 0; i < conditions.size(); i++){
            WrapCondition condition = conditions[i];
            query += ' ' + condition.fieldApiName + ' ' + condition.operator + ' :bindVar' + i;
            if(i < conditions.size() - 1){
                query += ' AND ';
            }
            bindVariables.put('bindVar' + i, condition.value);
        }
        List<sObject> records = Database.queryWithBinds(query, bindVariables, AccessLevel.USER_MODE);
        List<Id> idList = new List<Id>();
        for(sObject obj : records){
            idList.add(obj.Id);
        }
        return idList;
    }
}