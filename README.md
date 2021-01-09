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

This software controls the flow of planes at an airport.

The planes can land and take off if the weather is sunny.

Planes cannot land or take off if the weather is stormy.

1. irb -r 'airport.rb'

Airport - stores Planes in the HANGAR; Air Traffic Controller works here
- Airport.land: adds a plane to the HANGAR 

AirTrafficController

- AirTrafficController.landing_control:
  - checks landing conditions
  - approves landing unless WEATHER is STORMY

Plane
- Plane.flying?
  - returns TRUE if the Plane is in the sky
