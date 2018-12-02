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

Code
---------

* The code is structured in 3 classes: Airport, Airplane and Weather
* The Airport class is in charge of the landing / take offs taking place and the state of the airport in general (what airplanes are on the ground)
* The Airport is initialized with a default capacity and the weather (these will be overwritten at times in the the tests to test different scenarios). It is empty to start with.
* The Airplane only manages new instances of itself
* The Weather class determines if it's stormy or not by using the random method

Tests
-------

* Built around the user stories
* Mainly organized in two groups - around landing and take offs (checking conditions around the airplanes / airport state and the weather)
