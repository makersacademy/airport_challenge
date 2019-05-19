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

Project Summary
---------
Airport Challenge is an app for landing and taking off planes from an airport. A default airport capacity is set to 4, with the added option of adding a new airport capacity upon creation of a new airport object. You can run the code as follows:

```
$ irb
2.5.0 :001 > require './lib/airport.rb'
 => true
2.5.0 :002 > require './lib/plane.rb'
 => true
2.5.0 :003 > airport = Airport.new
 => #<Airport:0x00007fc0980933b8 @show_planes=[], @capacity=4>
2.5.0 :004 > plane = Plane.new
 => #<Plane:0x00007fc09809b680>
2.5.0 :005 > airport.land(plane)
 => [#<Plane:0x00007fc09809b680>]
2.5.0 :006 > airport.plane_takeoff
 => #<Plane:0x00007fc09809b680>
2.5.0 :007 >
2.5.0 :008 > exit
```
Code follows the single responsibility principle and has been tested with RSpec. All tests are currently green.

Further Improvements
---------
Weather validation was not added in the timeframe given due a lack of understanding of how to test using stubs and mocks. With further time and exploration a conditional would be added to both the land and plane_takeoff methods to check weather conditions for safe travel. A test would be written to stub the random value given by the weather method for both 'STORMY' and 'SUNNY'.
