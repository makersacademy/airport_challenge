Airport Challenge
=================

Airport accepts and releases a given number of planes depending on the weather.

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


 #### still to do: 
 - tests are not DRY and should be refactored
 - suspected edge cases that will fail program: plane already grounded can land, plane already in air can take off
 - suspected incorrect test syntax in mocking methods
