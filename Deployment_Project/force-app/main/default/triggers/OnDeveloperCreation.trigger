Trigger OnDeveloperCreation on DeveloperG__c (before insert) {
	OnDeveloperCreationHandler.process(Trigger.New);
}