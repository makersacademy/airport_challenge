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

Task
-----
Link to task on Makers repo.

Steps Taken
-----------
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
I created an Airport class and a Plane class.

The Airport class contains methods to land the plane (which is passed an instance of the Plane class) and to take off. Landed planes are pushed into an instance variable array (hanger) that is created when the Airport class is initialized. Planes that take off remove the last element of the hangar array using the pop method, and confirm the plane is no longer in the hanger using string interpolation.


Next Steps
-----------
I have not yet completed this challenge.

```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```

I have created a `capacity` method and variable. I want to use the `hangar_full?` method to compare the `capacity` with the length of the hanger array to determine if the hangar is full. It appears that I need to work on how to test for conditionals as I know how to create the code here but not the test. The expectation is that the `land` method won't run if the count of the `hanger` array is the same as the `capacity`.

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
My initial thought with this User Story is that the attr_reader would need to be changed to attr_accessor so that the capacity can be overwritten.

```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```
Use test doubles and stubs.

Lastly, defend against edge cases.
