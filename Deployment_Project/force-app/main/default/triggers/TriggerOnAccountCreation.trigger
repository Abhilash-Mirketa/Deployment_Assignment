Trigger TriggerOnAccountCreation on Account (after insert) {
    TriggerOnAccountCreationHandler.startProcess(Trigger.New);
}