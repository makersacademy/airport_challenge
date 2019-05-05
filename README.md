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

This project is a request from a client to write he software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  

The system ensures that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

The following user stories have been created in collaboration with the client. 

I have also added the breakdown into objects and messages, along with the IRB feature tests for each one:

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```
Objects                      |          Messages

Traffic Controller(User)			
airport 					 |   		land(plane)

airport = Airport.new
plane = Plane.new
airport.land(plane)

```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

```
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 
```
```
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```
```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
```
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate 
```

The plan is to test drive the creation of a set of classes/modules to satisfy all the above user stories. 
A random number generator will be used to set the weather. 
A stub will be used to override random weather to ensure consistent test behaviour.


