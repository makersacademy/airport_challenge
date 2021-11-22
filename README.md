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

User Stories
-----

```
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
```

For this challenge I have used 2 classes and 1 module:

* *Airport class*
  * it defines an airport instance
  * it initialize with a `@landed` instance variable set to an empty list to manage the state of the system: landing and departing planes
  * it has a `@capacity` instance variable set to `DEFAULT_CAPACITY` constant unless otherwise specified with  `Airport.new(capacity)`
  * it has a `land` method and a `departure` method to manage landing and take off of planes
  * it has a `full` method to check if `@landed` has reach maximum `@capacity`, they add or remove planes from `@landed` list
* *Plane class*
  * it defines a plane instance
  * it simply create an object with a instance variable `@flying` set to true
  * to manage edge cases the instance variable `@flying` of Plane class is set to `false` every time the plane has landed and set to `true` when take off. 
* *Weather module*
  * it has a `forecast` method
  * it randomly return `"sunny"` (80% chance) or `"stormy"` (20% chance)

I have used TDD approach by writing Rspec test for each functionality by following the RED-GREEN-REFACTOR process together with feature testing on irb