trigger NCETrigger on New_Contact_Entry__e (after insert) {
        for(New_Contact_Entry__e nce : Trigger.New){
            System.debug('Name : '+ nce.name__c + ' BirthDate : ' + nce.birthDate__c);
	}
}