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

Technologies Used
---------

* Ruby
* RSpec

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

Note to self/reader: SLOW THE DOWN. The answer is usually dead simple once you break down the problem. Your brain can't handle the whole problem at once, small steps for the win!

Object  | Messages/Methods
------------- | -------------
airport | instruct plane to take off, instruct a plane to land
airplane | confirm landed, confirm take off
weather | stormy, sunny etc, don't take off if stormy, don't land if stormy


```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```
Airport as class, create method to land plane, test class object responds to land plane method and takes in an argument for adding planes to hangar.
Plane is antoher class object, create another Ruby file to init a plane object.
Hangar is a new array object created with the Airport class init.

```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
Create airport class method for take_off, remove the plane from the hangar array. Somehow confirm it has indeed taken off, prompt?
```
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 
```
Keeping the program cohesive, make another class for Weather. Another ruby file to create weather object. Randomize the weather somehow. Give class a method that Airport can use to get weather status.

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```
Create predicate method in weather class that landing method can call to see if weather is OK to land. use fail statement and print message if weather stormy
```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full
```
Check hangar array length is not the same as capacity, use another predicate method to do this. then call the method as part of fail statement in landing method.
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
Use a capacity attribute and pass as argument when a new Aiport object is created/initialized.
A default capacity will be assigned as a CONSTANT and defaulted in the argument. It will always be created with the CONSTANT value unless user specifies.
