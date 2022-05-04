@Istest
public with sharing class BookingsTriggerHandlerTest {
    //mettre en place 3 scenari
    @TestSetup
    static void makeData(){

        Contact con = new Contact();
        con.LastName = 'Contact';
        insert con;

        Boat__c boat = new Boat__c();
        boat.name = 'New Boats';

        boat.Contact__c = con.Id;
        

        insert boat;
        
    }

    //nv booking avec EndDate < date.today()
    @IsTest
    static void pastBooking(){
        //Given     
        
        Booking__c booking = new Booking__c();
        booking.startDate__c = Date.today().addDays(-20);
        booking.EndDate__c = Date.today().addDays(-10);

        Boat__c boat1 = [SELECT Id FROM Boat__c WHERE Name = 'New Boats' LIMIT 1];
        booking.Boat__c = boat1.Id;
  
        List<Booking__c> listBooking = new List<Booking__c>{booking};


        //When
        Test.startTest();
        BookingTriggerHandler.onAfterInsert(listBooking);
        Test.stopTest();

        //Then
        Boat__c boatAfter = [SELECT Id, Disponibilite__c FROM Boat__c WHERE Name = 'New Boats' LIMIT 1];
        System.assertEquals('Disponible', boatAfter.Disponibilite__c, 'Devrait etre dispo');

    }

   
  
}
