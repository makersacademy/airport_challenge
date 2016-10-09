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

This simple terminal app which enables air traffic controller and system designer to control flows of planes at an airport. It allows planes to land and take off during good weathers so passengers will be safe.


Features
---------
- [x] Allow plane to land and take off from the airport
- [x] Confirm plane status (whether they have landed or taken off)
- [x] Prevent planes to land or take off during stormy weathers (pending)
- [ ] Ensure planes that had taken off are not in airport and planes that have landed cannot land again
- [x] Enable default capacity to be set


Installation
-------
* Fork this repo
* Clone repo to your local machine by typing **git clone SSH** in your terminal
* Inside *airport-challenge* folder, install required gems using Bundler, type **gem install bundler** and **bundle install**
* To start using the app, run **irb** and **require './lib/airport'** - see screenshot below
* To run tests type **rspec** in the terminal

Code example in irb
--------
```
2.2.3 :001 > require './lib/airport'
 => true
2.2.3 :002 > airport = Airport.new
 => #<Airport:0x007ffa998aa7c8 @planes=[], @capacity=10, @weather_today=#<Weather:0x007ffa998aa6b0 @weather=7>>
2.2.3 :003 > plane001 = Plane.new
 => #<Plane:0x007ffa9989be80 @flying=true>
2.2.3 :004 > airport.land(plane001)
RuntimeError: No landing, it's too stormy!
	from /Users/lichien/MA-01/airport_challenge/lib/airport.rb:16:in `land'
	from (irb):4
	from /Users/lichien/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :005 > airport.land(plane001)
 => "Plane arrived in the airport"
2.2.3 :006 >
```

Contributors
--------
**lcbeh**
