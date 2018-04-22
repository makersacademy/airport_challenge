Airport Simulation
=================

```
        ______
        _\____\___
=  = ==(___MUZZI__)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

## Project Overview ##

This application has been built to create an interactive airport simulation for
use in a REPL environment.
It allows the user to create Airport and Plane objects and test how they interact with each other.
The user can land planes at specific airports, store them and release them.
The system also has precautionary measures, such as blocking flights when stormy conditions are in place.
Care has been taken to avoid glitches in the system, such as duplicate planes appearing in the same place.

## How to use ##
1. Fork this repository and clone it to your machine
2. Run the command ``` gem install bundle ```
3. Run ``` bundle ```
4. Open a REPL environment
5. Require ``` ./lib/airport.rb ```
6. Require ``` ./lib/plane.rb ```

Example Use:
+ Type ``` jfk = Airport.new(n) ``` to create a new airport called "jfk", where "n" is an optional number input for customising the maximum plane capacity of the airport
+ Type ``` bowing747 = Plane.new ``` to create a new plane called "bowing747"
+ Type ``` jfk.land(bowing747) ``` to land the plane in the airport
+ Type ``` jfk.plane_present?(bowing747) ``` to check if a plane is in the airport
+ Type ``` jfk.take_off(bowing747) ``` to release the plane from the airport

## The following technologies were used in the creation of this system: ##
+ Rake
+ RuboCop
+ SimpleCov

## Testing ##
Rspec was used to test-drive this application.
If you would like to see the tests run, simply type
``` rspec ```
from the project directory
