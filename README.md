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

Setup
-------

1. Clone the repo to your local machine
2. Change into the directory
3. run `bundle`
4. start `irb`

Instructions
-------
You are the air traffic controller, see the below irb transcript as to how to use the software:
``` ruby
2.4.0 :001 > require './lib/airport.rb'
 => true 
2.4.0 :002 > airport = Airport.new
 => #<Airport:0x007fc1849608c8 @planes=[], @weather=#<Weather:0x007fc184960878 @outlook=:cloudy>, @capacity=10> 
2.4.0 :003 > plane = Plane.new
 => #<Plane:0x007fc184958d58 @status=:flying> 
2.4.0 :004 > airport.land plane
 => [#<Plane:0x007fc184958d58 @status=:parked>] 
2.4.0 :005 > airport
 => #<Airport:0x007fc1849608c8 @planes=[#<Plane:0x007fc184958d58 @status=:parked>], @weather=#<Weather:0x007fc184960878 @outlook=:cloudy>, @capacity=10> 
2.4.0 :006 > airport.take_off plane
 => #<Plane:0x007fc184958d58 @status=:flying> 
2.4.0 :007 > airport
 => #<Airport:0x007fc1849608c8 @planes=[], @weather=#<Weather:0x007fc184960878 @outlook=:cloudy>, @capacity=10>
```

You can also interrogate the plane nd airport objects to find out about them:
``` ruby
2.4.0 :008 > airport.land plane
 => [#<Plane:0x007fc184958d58 @status=:parked>] 
2.4.0 :009 > airport.capacity
 => 10 
2.4.0 :010 > airport.weather.outlook
 => :cloudy 
2.4.0 :011 > airport.planes
 => [#<Plane:0x007fc184958d58 @status=:parked>] 
2.4.0 :012 > plane.status
 => :parked 
 ```
 
 Try creating more planes or airports and landing them as you need to. Beware an airport with stormy weather (1 in 6 chance on instantiation), you will not be able to land any planes.
 ```ruby
 2.4.0 :016 > airport = Airport.new
 => #<Airport:0x007fc185877f50 @planes=[], @weather=#<Weather:0x007fc185877f00 @outlook=:stormy>, @capacity=10> 
 ```
 
 Additionally
-------
Airports can be created with a different capacity to the default (10).
``` ruby
2.4.0 :017 > Airport.new(100)
 => #<Airport:0x007fc1858745f8 @planes=[], @weather=#<Weather:0x007fc1858745a8 @outlook=:cloudy>, @capacity=100> 
 ```
