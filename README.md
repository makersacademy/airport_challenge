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


Steps
-------
* This software controls the flow of planes at an airport.
* Planes can land and take off provided that the weather is not stormy.
* Planes cannot land if the airport is full.
* The airport capacity can be overridden.


Documentation
-------
* Documentation can be found at './docs/table_of_contents.html'
* A feature test can be found at './spec/feature_test.rb'


```
2.3.0 :001 > require './lib/airport'
 => true
2.3.0 :002 > airport=Airport.new(1)
 => #<Airport:0x007fa08a0205f8 @capacity=1, @planes=[], @weather=#<Weather:0x007fa08a0205a8>>
2.3.0 :003 > plane = Plane.new
 => #<Plane:0x007fa08a011148>
2.3.0 :004 > airport.land plane
RuntimeError: Unable to land due to stormy weather
	from /Users/murilodalri/Projects/Makers/airport_challenge/lib/airport.rb:41:in `can_land?'
	from /Users/murilodalri/Projects/Makers/airport_challenge/lib/airport.rb:15:in `land'
	from (irb):4
	from /Users/murilodalri/.rvm/rubies/ruby-2.3.0/bin/irb:11:in `<main>'
2.3.0 :005 > airport.land plane
 => "#<Plane:0x007fa08a011148> landed at #<Airport:0x007fa08a0205f8>"
2.3.0 :006 > airport.take_off plane
 => "#<Plane:0x007fa08a011148> has departed from #<Airport:0x007fa08a0205f8>"
 ```


All content copyright Murilo Dal Ri © 2016 • All rights reserved.
