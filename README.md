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

Approach
--------

- Modeled an airport instructing planes to land, dependant on the weather
- 3 classes: Weather, Airport & Plane
- `@landed` stores the current status of the plane
- Utilised private methods to determine if an airport is full, cleared for landing/take off or if a plane is at the airport
- errors will be raised if any inconsistent actions are attempted (i.e taking off before landing)


Install
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`

Usage
-----

example usage below:

```
Pry
[4] pry(main)> airport = Airport.new
=> #<Airport:0x007fad9f91fb00 @capacity=10, @planes=[], @weather=#<Weather:0x007fad9f91fa60>>
[5] pry(main)> plane = Plane.new
=> #<Plane:0x007fad9e88dcb0>
[6] pry(main)> airport.land(plane)
RuntimeError: cannot land in stormy weather
from /Users/ainsley/Projects/airport_challenge/lib/airport.rb:18:in `land'
[7] pry(main)> airport.land(plane)
=> [#<Plane:0x007fad9e88dcb0 @landed=true>]
[8] pry(main)> airport.planes
=> [#<Plane:0x007fad9e88dcb0 @landed=true>]
[9] pry(main)> airport.take_off(plane)
=> #<Plane:0x007fad9e88dcb0 @landed=false>
[10] pry(main)> airport.planes
=> []
[11] pry(main)>
```

Authors
--------

Ainsley Chang
