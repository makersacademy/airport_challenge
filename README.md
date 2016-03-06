Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____JX____)
          \_____\___________________,-~~~~~~~`-.._
          /     j u n y u a n - a i r w a y s   |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

##Introduction

This program simulates an air traffic control system that would allow planes land and take off at an airport under certain weather conditions.

##Features

* Instruct and control landing
* Instruct and control take-off
* Create new capacity for airports
* Detect and report stormy weather conditions, and prevent landing or take-off when necessary

##How to use Airport

To clone this repo:
```
$ git clone git@github.com:junyuanxue/airport_challenge.git
```

Change to `airport_challenge` directory, open `irb` and require the `airport` file:
```
$ cd airport_challenge
$ irb
2.2.3 :001 > require "./lib/airport.rb"
 => true
```

Now we can build some airports:
```
2.2.3 :002 > heathrow = Airport.new(capacity: 50)
 => #<Airport:0x007fd68c172b80 @weather=#<Weather:0x007fd68c172ab8>, @capacity=50, @planes=[]>
2.2.3 :003 > frankfurt = Airport.new(capacity: 70)
 => #<Airport:0x007fd68c1686f8 @weather=#<Weather:0x007fd68c168680>, @capacity=70, @planes=[]>
2.2.3 :004 > schiphol = Airport.new
 => #<Airport:0x007fd68c15b700 @weather=#<Weather:0x007fd68c15b598>, @capacity=30, @planes=[]>
```

Let's have some planes as well. I think it'd make more sense to initialize them in the airport rather than in the sky (but the latter is cool, too):
```
2.2.3 :005 > ba = Plane.new(heathrow)
 => #<Plane:0x007fd68b8d34c0 @airport=#<Airport:0x007fd68c172b80 @weather=#<Weather:0x007fd68c172ab8>, @capacity=50, @planes=[#<Plane:0x007fd68b8d34c0 ...>]>, @flying=false>
2.2.3 :006 > lufthansa = Plane.new(frankfurt)
 => #<Plane:0x007fd68d006160 @airport=#<Airport:0x007fd68c1686f8 @weather=#<Weather:0x007fd68c168680>, @capacity=70, @planes=[#<Plane:0x007fd68d006160 ...>]>, @flying=false>
2.2.3 :007 > klm = Plane.new(schiphol)
 => #<Plane:0x007fd68b8a8400 @airport=#<Airport:0x007fd68c15b700 @weather=#<Weather:0x007fd68c15b598>, @capacity=30, @planes=[#<Plane:0x007fd68b8a8400 ...>]>, @flying=false>
```

To fly a plane (well, to instruct a plane to take off, more precisely):
```
2.2.3 :008 > heathrow.take_off(ba)
 => #<Plane:0x007fd68b8d34c0 @airport=#<Airport:0x007fd68c172b80 @weather=#<Weather:0x007fd68c172ab8>, @capacity=50, @planes=[]>, @flying=true>
```

Now it's flying! Let's land it in sweet sweet Amsterdam:
```
2.2.3 :009 > schiphol.land(ba)
RuntimeError: Landing prevented due to stormy weather
	from /Users/junyuanxue/Desktop/Makers/weekend-challenges/airport_challenge/lib/airport.rb:16:in `land'
	from (irb):9
	from /Users/junyuanxue/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
```

Oops, looks like there is a storm going on there. So Schiphol Airport is not an option for landing. Maybe our BA plane can change its route and try land in Frankfurt instead:
```
2.2.3 :010 > frankfurt.land(ba)
 => [#<Plane:0x007fd68d006160 @airport=#<Airport:0x007fd68c1686f8 @weather=#<Weather:0x007fd68c168680>, @capacity=70, @planes=[...]>, @flying=false>, #<Plane:0x007fd68b8d34c0 @airport=#<Airport:0x007fd68c1686f8 @weather=#<Weather:0x007fd68c168680>, @capacity=70, @planes=[...]>, @flying=false>]
```
Landed! Passengers will be grumpy that they end up in the wrong city but at least everyone is safe. :)

I have also considered edge cases to ensure the consistency of my air control system - try make a plane that's already flying take off again and it will tell you off (hopefully). :P

##To run the tests

In your terminal, type `$ rspec` under `airport_challenge` directory and it will run all the unit tests in spec files.

I have also created a `feature_spec.rb` file to store all the feature tests. To fun feature tests only, simply type:
```
$ rspec spec/feature_spec.rb
```

##Tools used

* Ruby
* RSpec

##Author

Junyuan Xue

[github](https://github.com/junyuanxue)  [blog](https://spinningcodes.wordpress.com/)

Thanks for reading :)
