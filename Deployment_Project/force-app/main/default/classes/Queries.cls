public class Queries {
    public static void ProcessQuery(){
        System.debug('Size of list ' + [SELECT Id, Name from Account WHERE Rating = 'Warm' WITH SECURITY_ENFORCED].size());
    }
}