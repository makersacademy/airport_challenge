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

This program simulates an air-traffic control system at an airport.
Planes can land and take-off from the airport.
Planes are only capable of take-off/landing when the weather conditions are not stormy.

The weather condition is specific to the airport and randomly generated with a 1 in 5 chance of it being unsuitable to take-off/land. The airport checks if the local weather is stormy before all take-off and landings.

By default new airports are set up with a maximum landed plane capacity of 10. However, this can be amended as required when initialising an airport. The programme does not allow any more planes to land at the airport when the number of planes in the airport is equal to the specified capacity.

The programme checks edge cases and ensures that a plane that already exists in the airport is not able to land. Conversely it ensures that a plane that is not in the airport can not take off.

### Assumptions
On initialisation, there are no planes in the airport hangar. All new planes must land in the airport first.

### Next Steps
- Apply DRY principle to the airport_spec.rb
- Add doubles for plane instances in airport_spec.rb
- Improve encapsulation by creating a Weather class
- Within Rspec, find way to create multiple unique instances without typing out.(Would help when trying to test that planes can’t land when airport full, while not throwing error for trying to land a plane that already exists in airport)
- Throw an error if a plane that does not exist at all tries to land at an airport. (Maybe create a directory in the Plane class to check against.)
- Add features to check that a plane already in airport_1 can not land at airport_2.

### Further reading
How to create multiple unique instances


### User Stories
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
