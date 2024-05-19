@RestResource(urlMapping = '/Account/*')
global with sharing class AccountWebServices {
	@HttpGet
    global static Account getAccountById(){
        RestRequest request = RestContext.request;
        String accId = request.requestURI.subString(request.requestURI.lastIndexOf('/')+ 1);
        System.debug(request.requestURI);
        try{
            Account acc = [SELECT Id, Name, Phone FROM ACCOUNT WHERE Id = :accId];
           	return acc;
        }
        Catch(DMLException e){
            System.debug(e.getMessage());
            return null;
        }
    }
    @HttpPost
    global static Id createAccount(String uName, String uPhone){
        try{
            Account acc = new Account(Name = uName, Phone = uPhone);
            Insert acc;
            return acc.Id;
        }Catch(DMLException e){
            System.debug(e.getMessage());
            return null;
        }
    }
    @HttpDelete
    global static void deleteAccount(){
        RestRequest request = RestContext.request;
        String accId = request.requestURI.subString(request.requestURI.lastIndexOf('/')+ 1);
        Account acc = [SELECT Id, Name, Phone FROM ACCOUNT WHERE Id = :accId];
        try{
            Delete acc;
        }Catch(DMLException e){
            System.debug(e.getMessage());
        }
    }
}