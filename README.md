Airport Challenge
=================

This repo has been created for the Week 1 Friday Ronin Challenge "Airport Challenge".

The challenge is to create and test drive a Ruby program which simulates the landing and take off of planes at an airport.

This challenge is based on the Week 1 Ronin Challenge entitled "Boris Bikes" and my approach to the airport challenge will be based on this.

The Airport Challenge instructions can be found [here](https://github.com/makersacademy/airport_challenge).

My Boris Bikes repo can be found [here](https://github.com/missamynicholson/Boris)

This irb transcript shows a feature test associated with each User Story of the Airport Challenge.

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

$ irb
2.2.3 :001 > airport = Airport.new
 => #<Airport:0x007fad5a91aeb0 @planes=[], @capacity=50, @weather=#<Weather:0x007fad5a91ae60>>
2.2.3 :002 > plane = Plane.new
 => #<Plane:0x007fad5a8968b8>
2.2.3 :003 > airport.land(plane)
 => [#<Plane:0x007fad5a8968b8 @flying=false>]
2.2.3 :004 > airport
 => #<Airport:0x007fad5a91aeb0 @planes=[#<Plane:0x007fad5a8968b8 @flying=false>], @capacity=50, @weather=#<Weather:0x007fad5a91ae60>>
```

```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

2.2.3 :005 > airport.takeoff(plane)
 => #<Plane:0x007fad5a8968b8 @flying=true>
2.2.3 :006 > airport
 => #<Airport:0x007fad5a91aeb0 @planes=[], @capacity=50, @weather=#<Weather:0x007fad5a91ae60>>
```

```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

2.2.3 :007 > airport.land(plane)
 => [#<Plane:0x007f9ae484c728 @flying=false>]
2.2.3 :008 > airport.takeoff(plane)
RuntimeError: Stormy weather
  from /Users/amynicholson/Desktop/MAKERS/airport_challenge/lib/airport.rb:18:in `takeoff'
  from (irb):8
  from /Users/amynicholson/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
```

```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

2.2.3 :009 > airport.land(plane)
RuntimeError: Stormy weather
  from /Users/amynicholson/Desktop/MAKERS/airport_challenge/lib/airport.rb:25:in `land'
  from (irb):9
  from /Users/amynicholson/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :010 > airport.takeoff(plane)
RuntimeError: Plane not in airport
  from /Users/amynicholson/Desktop/MAKERS/airport_challenge/lib/airport.rb:17:in `takeoff'
  from (irb):10
  from /Users/amynicholson/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
```

```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

2.2.3 :011 > airport = Airport.new
 => #<Airport:0x007fa94c02e890 @planes=[], @capacity=50, @weather=#<Weather:0x007fa94c02e7c8>>
2.2.3 :012 > 50.times {airport.land(Plane.new)}
 => 50
 2.2.3 :013 > airport.land(Plane.new)
RuntimeError: Airport full
  from /Users/amynicholson/Desktop/MAKERS/airport_challenge/lib/airport.rb:24:in `land'
  from (irb):13
  from /Users/amynicholson/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'

```

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

2.2.3 :014 > airport = Airport.new(Weather.new, 10)
 => #<Airport:0x007fa94b86ef88 @planes=[], @capacity=10, @weather=#<Weather:0x007fa94b86efb0>>
2.2.3 :015 > airport.capacity = 15
 => 15
2.2.3 :016 > airport
 => #<Airport:0x007fa94b86ef88 @planes=[], @capacity=15, @weather=#<Weather:0x007fa94b86efb0>>
2.2.3 :017 > 15.times {airport.land(Plane.new)}
 => 15
2.2.3 :018 > airport.land(Plane.new)
RuntimeError: Airport full
  from /Users/amynicholson/Desktop/MAKERS/airport_challenge/lib/airport.rb:24:in `land'
  from (irb):18
  from /Users/amynicholson/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'

```

```
As the system designer
To prevent against inconsistent behaviour
I would like to prevent a plane from taking off if it is already flying

2.2.3 :019 > plane
 => #<Plane:0x007fa94b92b5e8 @flying=true>
2.2.3 :020 > plane.take_off
RuntimeError: Plane is already flying
  from /Users/amynicholson/Desktop/MAKERS/airport_challenge/lib/plane.rb:17:in `take_off'
  from (irb):20
  from /Users/amynicholson/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'

```

```
As the system designer
To prevent against inconsistent behaviour
I would like to prevent a plane from landing if it isn't flying

2.2.3 :021 > plane
 => #<Plane:0x007fa94b92b5e8 @flying=false>
2.2.3 :022 > plane.land
RuntimeError: Plane is not flying
  from /Users/amynicholson/Desktop/MAKERS/airport_challenge/lib/plane.rb:12:in `land'
  from (irb):22
  from /Users/amynicholson/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
```

```
As the system designer
To prevent against inconsistent behaviour
I would like to prevent a plane from taking off from an airport it isn't in

2.2.3 :023 > airport = Airport.new
 => #<Airport:0x007fa94b950ff0 @planes=[], @capacity=50, @weather=#<Weather:0x007fa94b950e38>>
2.2.3 :024 > airport.takeoff(Plane.new)
RuntimeError: Plane not in airport
  from /Users/amynicholson/Desktop/MAKERS/airport_challenge/lib/airport.rb:17:in `takeoff'
  from (irb):24
  from /Users/amynicholson/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
```
