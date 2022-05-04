trigger Bookings on Booking__c ( before insert,
before update,
before delete,
after insert,
after update,
after delete,
after undelete) {
        //Mettre le statut insdiponible si le bateau est reservé selon les dates
        if(Trigger.isAfter && Trigger.isInsert){
          BookingTriggerHandler.onAfterInsert(Trigger.new);
        }
}