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

I then drew a lot of arrows everywhere to indicate the interactions between objects required by the messages.

My Red-Green-Refactor process made use of the tools available- I wrote feature and unit tests using Rspec, used the error messages to write the code necessary to make them pass, and then I used Rubocop to help in refactoring my code, making sure that it continued to pass the tests.

I implemented features in the following order:
* The two key objects- the airport and the plane
* The most basic methods- the ability for a plane to land at and take off from an airport
* Allowed a plane to have the attribute of 'flying', defaulting to false based on the assumption that planes are going to start off on the ground
* Allowed airports to have a capacity set at initialization, with a constant as a default value
* Allowed airports to store a landed plane as an instance variable, and for that value to be nil if the plane subsequently takes off
* Introduced complexity by allowing an airport to store multiple planes
* Created a guard condition so that trying to land a plane at a full airport would raise an error
* At this stage I realised my airport_spec file was getting a bit complicated and was creating a lot of instances of Plane.new- I substituted in some mocks instead.
* Created a method allowing the user to check that a given landed plane was now in the airport, and that a given taken off plane was no longer in the airport
* Began to implement more complex guard conditions:
..* An error is raised if the user tries to have a plane take off from an airport that it is not in
..* Made the 'land' and 'takeoff' methods alter a plane's 'flying' status, in order to prevent planes that are not currently flying from landing
...* At this point I ran into an issue, as I had previously decided that planes should initialise with 'flying' set to false, which meant I could no longer run testing examples that involved creating a new instance of Plane and then landing it! I revised my assumption to have planes start with 'flying' having a value of nil- perhaps to indicate a plane fresh from the aeroplane factory, which doesn't have a crew yet enabling it to fly or not to fly.
