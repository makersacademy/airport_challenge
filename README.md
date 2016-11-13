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


Description
===========
Create your own airport! Program includes the following features:
* Create as many airports as you like, with a customizable capacity
* Create, land, and take off as many planes as you like

But be aware:
* Variable weather, you can't land or take off when it's stormy!
* Can't land a plane that is already on the ground
* Can't take off a plane that is already flying
* Can't take off a plane that isn't at the airport

Project consists of an Airport class, Plane class, and a Weather module which is included in the Airport class.

How to Install
==============
1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`

How to Use
==========
1. Open a terminal and run `irb` or `pry`
2. Require `./lib/airport`
3. Create an airport and some planes

```
[1] pry(main)> require './lib/airport'
=> true
[2] pry(main)> airport = Airport.new
=> #<Airport:0x007fbbab2adb40 @capacity=2, @planes=[]>
[3] pry(main)> plane = Plane.new
=> #<Plane:0x007fbbabbdf470 @flying=true>
[4] pry(main)> plane2 = Plane.new
=> #<Plane:0x007fbbab265ac0 @flying=true>
[5] pry(main)>
```

4. Land and take off a plane (may encounter stormy weather)

```
[5] pry(main)> airport.land(plane)
=> "#<Plane:0x007fbbabbdf470> has landed."
[6] pry(main)> airport.take_off(plane)
RuntimeError: #<Plane:0x007fbbabbdf470> cannot take off due to stormy weather.
[7] pry(main)> airport.take_off(plane)
=> "#<Plane:0x007fbbabbdf470> has left the airport."
```

History
=======
Project was forked from Makers Academy as part of a weekend challenge. The challenge was to create a program to the specification noted above (see: Description).
My approach to solving this challenge involved using TDD. Further details of the creation process can be found in the commit descriptions on my [GitHub repository](https://github.com/kwilson541/airport_challenge/commits/master)
Weather was initially included as a private method within airport, and later seperated to be a module so that it could be included in any later programs that would require a weather module.