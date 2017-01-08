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

Structure
---------
- The controller creates an instance of the class Action
- Then the controller calls either the function land or takeoff on that Action, telling it the plane to the airport
- Planes are instances of the class Plane
- Airports are instances of the class Airport
- Airports have weather, usually 'sunny' but occasionally 'stormy'
- Airports have a maximum capacity, this has a default value of 1 or can be overwritten using Airport.new(capacity_value)

Example Script
---------
    new_plane = Plane.new
    new_airport = Airport.new
    Action.new.land(new_plane, new_airport)

Error Cases
---------
- A plane cannot land or takeoff in stormy weather
- A plane cannot land at an airport that is full
- A plane cannot take off from an airport it isn't in
- A plane cannot land if it has already landed
