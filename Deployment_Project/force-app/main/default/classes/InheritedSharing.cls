public inherited sharing class InheritedSharing {
	public static void performDML() {
        List<Contact> conList = new List<Contact>();
        if(Schema.sObjectType.Account.isAccessible()) {
            Account acc = [Select Name,Id from Account WHERE Name = 'Tech Solutions' LIMIT 1];
            Contact con = new Contact();
            con.LastName = acc.Name;
            conList.add(con);
        }
        if(conList.size() > 0){
            if(Schema.sObjectType.Contact.isCreateable()) {
                insert conList;
            }
        }
    }
}