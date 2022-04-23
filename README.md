Airport Challenge
=================

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

**Note**
---------

I wasn't able to feature test the programme in IRB myself, because of an error that I can't get round: "`require': cannot load such file -- airport (LoadError)", which prevents me from testing in IRB. 

That said, I have pretty thoroughly gone over the unit tests - so hopefully the functional tests work as expected!

Summary
---------

This programme exists to help safely manage traffic at an airport. The user requirements this programme was built around are:

As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 


Usage
---------
1. Clone the repo from GitHub
2. Run IRB, and require 'airport.rb' and 'plane.rb'
3. Create an instance of plane (plane = Plane.new)
4. Test the functionality of the programme, as below:

        - Check if a plane can take off
        - Take off
        - Check if the plane can land
        - Land the plane

5. Landing multiple planes may cause the airport to be at capacity, in which case an error will be thrown if trying to land further planes.
6. Poor weather conditions are randomly generated, and will occasionally cause errors to be thrown when attempting to land/take off. 