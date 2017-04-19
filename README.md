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

Makers Academy Weekend Challenge One.

Simple air traffic control program to instruct planes to land and takeoff from
airports.

--------------------------------------------------------------------------------
FEATURES

airport = Airport.NEW(x) -
Creates a new airport with 'x' capacity. If argument is left blank, capacity will
default to 20.

plane.landed -
Plane status. If true, then plane is in an airport, if false,
    plane is in the air.

airport.land(plane) -
Lands plane if the following conditions are met; weather
    is fine, airport has available capacity & the plane is not already on the
    ground.

airport.takeoff(plane) -
Launches plane if the following conditions are met; weather is fine & the plane
    is not already in the air.

--------------------------------------------------------------------------------
TESTING

Program does not pass testing consistently as I haven't been able to stubs the
weather variable. So certain test pass and fail depending on the random weather
generated at the time of the test.
