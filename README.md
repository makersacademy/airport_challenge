
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

---------
## Manage your airport - ruby program

This program was designed to help you manage your airport (in case you have one).

Program was written in Ruby, tested with RSPec.

In the program you can:
- create Airport (`Airport.new`) objects;
  - the default capacity of an airport is 5 planes, but you can set it to whatever value while creating a new airport.
- create Plane (`Plane.new`) objects;
  - at default, a new plane has a status of `flying` - is outside an airport. The initial status can be changed to `at_airport`.
- land a plane at an airport (`plane.land(airport)`) only when:
  - it's sunny at the airport;
  - there are empty spots at the airport;
  - the plane hasn't been landed
- take off a plane from an airport (`plane.take_off(airport)`) when:
  - it's sunny at the airport;
  - the plane has been previously put to the particular airport.
- check the status of plane (`plane`)
- check the status of an airport (`airport`)
