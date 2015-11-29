Airport Challenge

Software for basic control of airplane traffic.

Lib Contains: 

A. airport.rb
B. plane.rb
C. weather.rb

A.Airport.rb :
Contains the Airport class
  
  Airport accepts parameter which will override the default capacity of the airport.
  
  Available Methods :
    1.instruct_plane_to_land
      takes plane as argument
      will add plane object to planes array at airport.
    
      private methods called each time method called
        full_airport_landing_refusal_check - refuses to accept plane when airpor planes array full.
        landing_status_check(landing_plane) - checks plane obj is not already landed 
        weather_check  - checks weather conditions (see below)
    
    finally returns landing confirmation message 
    
    2.instruct_plane_to_take_off
      takes plane as argument
      will modify the planes state to in-flight and remove from airport planes(array)
      
      private methods called each time method called
        take_off_status_check(departing_plane) - checks plane is not already inflight
        take_off_any_planes_check - checks there are planes at airport
        weather_check - checks weather conditions (see below)
    
    finally returns take off confirmation message
    
    3.weather_check
     will call the weather class from weather.rb and then return sunny or stormy depending on random selection from       array.
     
B.Plane.rb
  Contains the Plane class
     
  Available Methods :
   
   1. plane_landing
       
      changes the plane state to "Landed" and returns this as a string
      
   2. plane_taking_off
     
      changes the plane state to "In-Flight" and returns this as a string

C. Weather.rb

  Contains Weather class
  
  Available Methods :
  
  1. weather_report 
  
    returns a randomly selected string representing weather from a weather_array
    array returns "sunny" or "stormy" strings with 20% chance of stormy being returned.
  
NOTE: spec tests provided in spec folder. BDD methodology has been implemented in this software.
      Doubles, Method stubs have been used in spec tests to seperate the each test file and enable isolated non            dependent testing.

     Object                  Message
     
     Plane                   takeoff
                             land
     
     Airport                 default capacity over-ride
                             refuse landing when full
                             refuse take off when empty
                             refuse take off when stormy
                             refuse landing when stormy
                             confirmation of take off
                             confirmation of landing
                             
                             
