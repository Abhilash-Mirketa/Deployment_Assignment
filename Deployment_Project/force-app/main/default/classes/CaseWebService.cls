@RestResource(urlMapping = '/Case/*')
global with sharing class CaseWebService {
    @HttpGet
    global static List<Case> getAllCases(){
        try{
            List<Case> caseList = [Select Id, Subject, Status from Case];
            return caseList;
        }catch(DMLException e){
            System.debug(e.getMessage());
            return null;
        }
    }
    global static Case getCaseById(){
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        try{
            Case cas = [Select Id, Subject, Status from Case where Id = :caseId];
            return cas;
        }catch(DMLException e){
            System.debug(e.getMessage());
            return null;
        }
    }
    @HttpPost
    global static Id createCase(String subject, String status){
        try{
            Case cas = new Case(Subject = subject, Status = status);
            insert cas;
            return cas.Id;
        }catch(DMLException e){
            System.debug(e.getMessage());
            return null;
        }
    }
    @HttpDelete
    global static void deleteCase(){
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        try{
            Case cas = [Select Id from Case where Id = :caseId];
            delete cas;
        }catch(DMLException e){
            System.debug(e.getMessage());
        }
    }
    @HttpPut
    global static void upsertCase(String id, String subject, String status){
        try{
            Case cas = new Case(Id = id, Subject = subject, Status = status);
            upsert cas;
        }catch(DMLException e){
            System.debug(e.getMessage());
        }
    }
    @HttpPatch
    global static Id updateCase(){
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        try{
            Case cas = [Select Id from Case where Id = :caseId];
            Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(request.requestBody.toString());
            System.debug(params);
            for(String fieldName : params.keySet()){
                cas.put(fieldName, params.get(fieldName));
            }
            update cas;
            return cas.Id;
        }catch(DMLException e){
            System.debug(e.getMessage());
            return null;
        }
    }
}