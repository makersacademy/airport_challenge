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

Following the Red-Green-Refactor process, I began to test and develop in the following order:
* The two key objects- the airport and the plane
* The most basic methods- the ability for a plane to land at and take off from an airport
* Allowed a plane to have the attribute of 'flying', defaulting to false based on the assumption that planes are going to start off on the ground
* Allowed airports to have a capacity set at initialization, with a constant as a default value
* Allowed airports to store a landed plane as an instance variable, and for that value to be nil if the plane subsequently takes off
* Introduced complexity by allowing an airport to store multiple planes
