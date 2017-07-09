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

This is a simple model of an airport and air traffic control system. It models planes landing at airports and being stored in them, and of taking off. It controls for weather conditions, allowing neither takeoffs nor landings when the weather is bad. Airports in this model can have varying capacities, which can be changed after the airport is instantiated, but have a set default capacity.

Approach
---------
I began to tackle this challenge by mapping out the objects and messages referred to in the user stories, like so:

| Objects                  | Messages                                    |
| ------------------------ |---------------------------------------------|
| Air Traffic Controller   | Instruct planes to take off and land        |
|                          | Confirm if a plane has landed               |
|                          | Prevent takeoff and landing in poor weather |
| Plane                    | Take off and land                           |
| Airport                  | Have a capacity                             |
|                          | Allow planes to takeoff and land            |
|                          | Store landed planes                         |
| System Designer          | Able to change airport capacity             |

My Red-Green-Refactor process made use of the tools available- I wrote feature and unit tests using Rspec, used the error messages to write the code necessary to make them pass, and then I used Rubocop to help in refactoring my code, making sure that it continued to pass the tests.

I implemented features in the following order:
* The two key objects- the airport and the plane- were established as classes
* The most basic methods for the airport class- the ability for a plane to land at and take off from an airport
* Allowed airports to have a capacity set at initialization, with a constant as a default value
* Allowed airports to store landed planes, with appropriate guard condition when full
* Enabled the user to check that a given landed plane was now in the airport, and that a given taken off plane was no longer in the airport
* Implemented guard conditions against edge cases
* Implemented weather system based on a random number generator, which controls when planes can take off and land
* Implemented ability for the user to change an airport's capacity
* Refactored thoroughly and made sure all tests were using mocks and stubs where necessary
