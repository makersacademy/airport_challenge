Makers End of Unit Challenge - Airport Challenge
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
We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

## User Stories

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```
```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
```
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
```
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 
```
```
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

## Approach
In my approach to this challenge, from each user story I highlighted key words i.e. (**INSTRUCT** a **PLANE** to **LAND** at an **AIRPORT**) and then used these as a starting point for writing a feature test, in order to then gain an idea of what it is I needed to write a unit test for e.g. :
```
2.6.5 :001 > airport = Airport.new
Traceback (most recent call last):
        4: from /Users/james/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        3: from /Users/james/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        2: from /Users/james/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):1
NameError (uninitialized constant Airport)

2.6.5 :001 > plane = Plane.new
Traceback (most recent call last):
        4: from /Users/james/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        3: from /Users/james/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        2: from /Users/james/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):1
NameError (uninitialized constant Plane)
```

Once I had done this I then followed the TDD red/green/refactor approach by writing a test, solving it with the minimum amount of code possible and then going on to improve it.

```
Example Test:

it 'can create an instance of Airport' do
    airport = Airport.new
    expect(airport).to be_kind_of Airport
  end

Code:

class Airport
end   
```

I would then check my feature test again before moving onto the next part
```
2.6.5 :001 > require './lib/airport'
 => true
2.6.5 :002 > airport = Airport.new
 => #<Airport:0x00007f852086dba0>
```

### Where I got to and what is left
I managed to meet all the user requirements for this challenge but there are still edge cases that need to be accounted for. Namely the fact that planes in an airport can be manually set as 'flying' 
```
2.6.5 :011 > plane.set_as_flying
 => true
2.6.5 :012 > airport
 => #<Airport:0x00007fa0ee105bf8 @planes=[#<Plane:0x00007fa0ee10ce08 @flying=true>], @capacity=10, @weather_conditions="sunny">
```
... and flying planes can be manually set as 'landed'
```
r2.6.5 :001 > require './lib/airport'
 => true
2.6.5 :002 > airport = Airport.new
 => #<Airport:0x00007fc5f10f92e0 @planes=[], @capacity=10, @weather_conditions="sunny">
2.6.5 :003 > plane = Plane.new
 => #<Plane:0x00007fc5f00a2dd8 @flying=true>
2.6.5 :004 > plane.set_as_landed
 => false
2.6.5 :005 > airport
 => #<Airport:0x00007fc5f10f92e0 @planes=[], @capacity=10, @weather_conditions="sunny">
```


## Tech Stack
Ruby 2.6.5  
RSpec

## Instructions

When a new **Airport** is initialized it will default to a capacity of 10 and will also have a random weather state (either 'sunny' or 'stormy')
```
2.6.5 :001 > require './lib/airport'
 => true
2.6.5 :002 > airport = Airport.new
 => #<Airport:0x00007f9ed98695a0 @planes=[], @capacity=10, @weather_conditions="sunny">
```

It is possible to overwrite the default capacity when the Airport is initialized
```
2.6.5 :004 > airport = Airport.new(20)
 => #<Airport:0x00007fad35898c50 @planes=[], @capacity=20, @weather_conditions="stormy">
```

When a new instance of a **Plane** is created, it defaults to a 'flying' state (true)
```
2.6.5 :003 > plane = Plane.new
 => #<Plane:0x00007fad3588b168 @flying=true>
```

To land a flying plane the **land()** method can be called, taking one argument - the plane
```
2.6.5 :009 > airport.land(plane)
 => [#<Plane:0x00007fad3588b168 @flying=false>]
2.6.5 :010 > airport
 => #<Airport:0x00007fad35898c50 @planes=[#<Plane:0x00007fad3588b168 @flying=false>], @capacity=20, @weather_conditions="sunny">
```

To allow a plane to take off use the **take_off** method (it's a 'last in, first out' system)
```
2.6.5 :006 > airport.take_off
 => #<Plane:0x00007fca6295b300 @flying=true>
2.6.5 :007 > airport
 => #<Airport:0x00007fca6294d840 @planes=[], @capacity=10, @weather_conditions="sunny">
```

It wont be possible for planes to land if the weather is stormy
```
2.6.5 :009 > airport = Airport.new
 => #<Airport:0x00007fca6299d688 @planes=[], @capacity=10, @weather_conditions="stormy">
2.6.5 :010 > airport.land(plane)
Traceback (most recent call last):
        5: from /Users/james/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        4: from /Users/james/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        3: from /Users/james/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):10
        1: from /Users/james/ruby/makers/end-of-week-challenges/1_airport_challenge/airport_challenge/lib/airport.rb:20:in `land'
RuntimeError (Unable to land due to stormy weather)
```

... or take off
```
2.6.5 :014 > airport.take_off
Traceback (most recent call last):
        5: from /Users/james/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        4: from /Users/james/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        3: from /Users/james/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):14
        1: from /Users/james/ruby/makers/end-of-week-challenges/1_airport_challenge/airport_challenge/lib/airport.rb:29:in `take_off'
RuntimeError (Unable to take off due to stormy weather)
```

But it is possible to request for an update on the state of the weather, with the chance that the skies may have cleared up
```
2.6.5 :015 > airport
 => #<Airport:0x00007fca6299d688 @planes=[#<Plane:0x00007fca6295b300 @flying=false>], @capacity=10, @weather_conditions="stormy">
2.6.5 :016 > airport.weather_update
 => "stormy"
2.6.5 :017 > airport.weather_update
 => "stormy"
2.6.5 :018 > airport.weather_update
 => "sunny"
```

A plane that has already landed can't re-land
```
2.6.5 :009 > airport.land(plane)
 => [#<Plane:0x00007f856e15bd28 @flying=false>]
2.6.5 :010 > airport.land(plane)
Traceback (most recent call last):
        5: from /Users/james/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        4: from /Users/james/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        3: from /Users/james/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):10
        1: from /Users/james/ruby/makers/end-of-week-challenges/1_airport_challenge/airport_challenge/lib/airport.rb:18:in `land'
RuntimeError (This plane has already landed)
```

And a plane can't land if the airport is full
```
2.6.5 :004 > airport
 => #<Airport:0x00007ff44582d660 @planes=[#<Plane:0x00007ff445864200 @flying=false>, #<Plane:0x00007ff4458641b0 @flying=false>, #<Plane:0x00007ff445864138 @flying=false>, #<Plane:0x00007ff445864098 @flying=false>, #<Plane:0x00007ff445864020 @flying=false>, #<Plane:0x00007ff44585ff48 @flying=false>, #<Plane:0x00007ff44585fea8 @flying=false>, #<Plane:0x00007ff44585fe58 @flying=false>, #<Plane:0x00007ff44585fe08 @flying=false>, #<Plane:0x00007ff44585fdb8 @flying=false>], @capacity=10, @weather_conditions="sunny">
2.6.5 :005 > airport.land Plane.new
Traceback (most recent call last):
        5: from /Users/james/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        4: from /Users/james/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        3: from /Users/james/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):5
        1: from /Users/james/ruby/makers/end-of-week-challenges/1_airport_challenge/airport_challenge/lib/airport.rb:16:in `land'
RuntimeError (Airport is full)
```