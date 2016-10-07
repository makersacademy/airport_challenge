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
Task
-----

To create software that will control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  

irb
-----

```Naomis-MBP:airport_challenge naomi$ irb
2.3.0 :001 > require './lib/airport'
 => true
2.3.0 :002 > require './lib/weather'
 => true
2.3.0 :003 > require './lib/plane'
 => true
2.3.0 :004 > airport = Airport.new
 => #<Airport:0x007f8fb9953b20>
2.3.0 :005 > plane = Plane.new
 => #<Plane:0x007f8fb994b588>
2.3.0 :006 > stormy = Weather.new
 => #<Weather:0x007f8fb9929870>
2.3.0 :007 > airport.take_off(plane)
 => #<Plane:0x007f8fb994b588>
2.3.0 :008 > airport.land(plane)
 => #<Plane:0x007f8fb994b588>
2.3.0 :009 > ```
