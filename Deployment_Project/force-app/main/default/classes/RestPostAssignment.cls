@RestResource(urlMapping = '/Candidates/*')
global with sharing class RestPostAssignment {
    @HttpGet
    global static List<Candidate__c> getAllCandidates(){
        List<Candidate__c> canList = [SELECT ID FROM Candidate__c];
        return canList;
    }
    /*global static Candidate__c getCandidateById(){
        RestRequest request = RestContext.request;
        String canId = request.requestURI.substring(request.requestURI.lastindexOf('/') + 1);
        Candidate__c can = [SELECT ID FROM Candidate__c WHERE ID = :canId];
        return can;
    }*/
	@HttpPost
    global static Id createCandidate(String name, String phone, String email){
        try{
            Candidate__c can = new Candidate__c();
            can.name = name;
            can.Phone__c = phone;
            can.Email__c = email;
            
            /*RestRequest request = RestContext.request;
        	Map<String,Object>params=(Map<String,Object>)JSON.deserializeUntyped(request.requestBody.toString());
            System.debug(params);
			for(String fieldName:params.keySet()){
                can.put(fieldName, params.get(fieldName));
            }*/
            
            Insert can;
            return can.Id;
        }
        catch(DMLException e){
            System.debug(e.getMessage());
            return null;
        }
     }
}