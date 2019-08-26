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
Here are the user stories and the pry interaction used to test them:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

[1] pry(main)> require './lib/airport.rb'
=> true
[2] pry(main)> require './lib/plane.rb'
=> true
[3] pry(main)> require './lib/weather.rb'
=> true
[4] pry(main)> weather = Weather.new
=> #<Weather:0x00007f9fc11a5140 @weather=:sunny>
[5] pry(main)> airport = Airport.new
=> #<Airport:0x00007f9fc08638c0 @capacity=20, @planes_array=[]>
[6] pry(main)> plane = Plane.new
=> #<Plane:0x00007f9fc11cefb8 @flying=false>
[7] pry(main)> plane.land_at(airport, weather)
=> "Plane has landed"
[8] pry(main)> airport
=> #<Airport:0x00007f9fc08638c0 @capacity=20, @planes_array=[#<Plane:0x00007f9fc11cefb8 @flying=false>]>

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

[9] pry(main)> plane.take_off_from(airport, weather)
=> "Plane has taken off"
[10] pry(main)> airport
=> #<Airport:0x00007f9fc08638c0 @capacity=20, @planes_array=[]>

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

.... keep creating weather until weather is stormy ....

[19] pry(main)> weather = Weather.new
=> #<Weather:0x00007f9fc118fcf0 @weather=:stormy>
[20] pry(main)> plane.land_at(airport, weather)
RuntimeError: Landing not allowed due to stormy weather

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

[21] pry(main)> weather = Weather.new
=> #<Weather:0x00007f9fc08581f0 @weather=:sunny>
[22] pry(main)> plane.land_at(airport, weather)
=> "Plane has landed"

.... keep creating weather until weather is stormy ....

[28] pry(main)> weather = Weather.new
=> #<Weather:0x00007f9fc013cc40 @weather=:stormy>
[29] pry(main)> plane.take_off_from(airport, weather)
RuntimeError: Take off not allowed due to stormy weather

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

[30] pry(main)> weather = Weather.new
=> #<Weather:0x00007f9fbf98e408 @weather=:sunny>
[31] pry(main)> airport
=> #<Airport:0x00007f9fc08638c0 @capacity=20, @planes_array=[#<Plane:0x00007f9fc11cefb8 @flying=false>]>
[32] pry(main)> airport.capacity.times { airport.land(plane) }
RuntimeError: Landing not permitted as airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

[1] pry(main)> require './lib/airport.rb'
=> true
[2] pry(main)> airport = Airport.new
=> #<Airport:0x00007fb49d264068 @capacity=20, @planes_array=[]>
[3] pry(main)> airport = Airport.new(30)
=> #<Airport:0x00007fb49da23128 @capacity=30, @planes_array=[]>
```

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Note that is a practice 'tech test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.

* **Submit a pull request early.**  There are various checks that happen automatically when you send a pull request.  **Fix these issues if you can**.  Green is good.

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.
