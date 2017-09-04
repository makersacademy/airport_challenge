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

Introduction
---------

A software that can be used to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

How to use
-------

1. New instance of Airport, instances of Airplanes and instance of weather need to be created.
2. Commands can be used on Airport: Land and Takeoff.
3. The default capacity of the airport is 20. It can be changed with the 'capacity' writer.
4. New instances of weather can be generated and used. No planes can land or takeoff when the weather is stormy.

Issues
-----

I did not have time to create a RSpec feature test.

Improvements can be made for more edge cases.

Use of accessors can be further reduced - if I know how....
