Ed's Airport Challenge
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

Program
---------

* Allows the creation of airports with varying capacity hangars
* Allows the creation of unique planes
* Airports can allow the landing and take off of unique planes
* If an airport is full, i.e. its hangar is at its full capacity, it will not allow further planes to land
* The program simulates variable weather; if it's stormy, airports will temporarily close
allowing no take off or landing of planes

Instructions
---------
The program can be run in the terminal/irb, and requires the following files;

airport.rb

plane.rb

weather.rb

* To create a new airport
``` Airport.new(capacity)```
* To create a new plane
```Plane.new```
* To land a plane at an airport
```airport.land(plane)```
* To take off a plane from an airport
```airport.take_off(plane)```
* To check which planes are grounded at an airport
```airport.hangar```
