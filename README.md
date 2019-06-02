Airport Challenge
=================

The program is divided into 3 classes: Airport, Plane and WeatherReport. 

**Airport object:**   
- can be assigned custom capacity when initialized
- is initialized in an empty state
- calls ground control to return current number of planes
- receives requests from planes: to land and to take off
- has private methods that act as tower: they ask another private method for current weather report before issuing permission or denying it to the methods that receive requests from planes 

**Plane object:**
- is assigned status of "in air" by default (as Airport objects are initialised in an empty state)
- can be assigned status "grounded" with the .update method

**WeatherReport object:**
- randomly selects weather forecast from an array of forecasts, 7 of which are good for flight and 3 of which are "stormy"

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

Task
-----

### User stories covered:

~As an air traffic controller~   
~So I can get passengers to a destination~   
~I want to instruct a plane to land at an airport~  

~As an air traffic controller~   
~So I can get passengers on the way to their destination~   
~I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport~  

~As an air traffic controller~   
~To ensure safety~   
~I want to prevent takeoff when weather is stormy~   

~As an air traffic controller~   
~To ensure safety~   
~I want to prevent landing when weather is stormy~   

~As an air traffic controller~   
~To ensure safety~   
~I want to prevent landing when the airport is full~   

~As the system designer~  
~So that the software can be used for many different airports~  
~I would like a default airport capacity that can be overridden as appropriate~  


 #### Still to do: 
 - tests are not DRY and should be refactored
 - suspected incorrect test syntax in mocking methods
 - deprecated methods used in some test mocks
 - overcomplicated logic of planes requesting permissions to land/takeoff and airports issuing/denying permissions: given more time, I would refactor methods to meet the SRP rule
 - planes and airports should have ids - given more time I would use the object id to identify that correct planes end up in correct airports
 - feature test that creates muliple airports that handle multiple planes
