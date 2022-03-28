trigger EmailChangeEventTrigger on EmailMessageChangeEvent (after insert) {
    
    HandleEmailChangeEvent.handleChangeEvent(Trigger.new);

}