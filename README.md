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

Description
---------
Small software that create and manages planes flying in and out of different airports.
The planes are allowed to fly only if the weather is good enough.

Structure
---------
The software is composed of 3 main object communicating between each other:
- Plane
  - creates new planes
  - check if planes are actually flying or landed
  - take off and land planes from/to airports  

- Airport
  - creates new airports
  - host a configurable amount of planes
  - authorize planes to land based on airport hangar capacity
  - retrieve weather reports
  - authorize planes to land and take off based on weather conditions  

- Weather
  - creates weather conditions
  - randomize weather conditions allowing in rare cases to return storm  

Next Steps
---------
