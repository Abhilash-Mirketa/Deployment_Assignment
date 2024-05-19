Trigger UpdateNoOfContactInAccount on Contact (after Insert, after Delete) {
    UpdateNoOfContactInAccountHandler.startProcess(Trigger.isInsert, Trigger.isDelete, Trigger.New, Trigger.Old);
}