public class AssignmentDML1 {
    public static void insertAllQueries(){
        List<Account> accountsToInsert = new List<Account>{
        new Account(Name='Tech Solutions', Industry='Technology',
        AnnualRevenue=1500000),
        new Account(Name='Financial Group', Industry='Finance',
        AnnualRevenue=2500000)
        };
        insert accountsToInsert;
        // Inserting Contacts
        List<Contact> contactsToInsert = new List<Contact>{
        new Contact(FirstName='John', LastName='Doe',
        Email='john.doe@example.com', AccountId=accountsToInsert[0].Id),
        new Contact(FirstName='Jane', LastName='Smith',
        Email='jane.smith@example.com', AccountId=accountsToInsert[1].Id)
        };
        insert contactsToInsert;
        // Inserting Opportunities
        List<Opportunity> opportunitiesToInsert = new List<Opportunity>{
        new Opportunity(Name='Tech Project A', CloseDate=Date.today(),
        StageName='Closed Won', Amount=50000,
        AccountId=accountsToInsert[0].Id),
        new Opportunity(Name='Finance Deal B', CloseDate=Date.today(),
        StageName='Prospecting', Amount=5000, 
        AccountId=accountsToInsert[1].Id)
        };
        insert opportunitiesToInsert;
    }
    /*public static void insertAcc(){
        Account acc = new Account(Name = 'New Tech Inc',
                                 Industry = 'Technology',
                                 AnnualRevenue = 2000000);
        Insert acc;
    }
    public static void insertContact(){
        Contact con = new Contact(
        FirstName = 'Emily',
        LastName = 'Johnson',
        Email = 'emily.johnson@example.com');
        Insert con;
    }
    public static void upsertAcc(){
        List<Account> accList = [SELECT Id FROM ACCOUNT];
        for(Account acc: accList){
            acc.BillingCountry = 'India';
        }
        accList.add(new Account(Name = 'Lila Hoz', BillingCountry = 'USA'));
        Upsert accList;
    }*/
    public static void undeleteContact(){
        List<Contact> conList = [SELECT Id, Name FROM Contact WHERE FirstName LIKE 'Emily' AND LastName LIKE 'Johnson' ALL ROWS];
        if(!conList.isEmpty()){
            Undelete conList;
        }
        return;
    }
}