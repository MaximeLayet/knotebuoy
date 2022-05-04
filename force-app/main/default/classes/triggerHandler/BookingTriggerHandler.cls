public with sharing class BookingTriggerHandler {
   
        public static void onAfterInsert(List<Booking__c> bookings){
            updateBoatStatus(bookings);
        }

        private static void updateBoatStatus(List<Booking__c> bookings){

            List<Boat__c> boatsToUpdate = new List<Boat__c>();

            //regarder les bookings
            for (Booking__c booking : bookings){

                Id boatId = booking.Boat__c;

                if (boatId != null) {

                    Date debut = booking.startDate__c;
                    Date fin = booking.endDate__c;
                    Boolean disponible = true;
    
                    if (fin < Date.today()){
    
                    } else if (debut >= Date.today().addDays(3)){
    
                    } else {
                        disponible = false;
                    }

                    if(!disponible) {
                        Boat__c boatToUpdate = new Boat__c(
                            Id = BoatId,
                            Disponibilite__c = 'Indisponible'
                            );
                            boatsToUpdate.add(boatToUpdate);
                    }
                }

            }
            update boatsToUpdate;
        }
    }

