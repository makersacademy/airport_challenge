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

Overview
---------

Software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

Getting started

1. `git clone https://github.com/BDCraven/airport_challenge.git`
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`

Usage

`irb`

Running tests

`rspec`
```

```
User Stories
---------

As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate


```

```


Approach to the challenge
---------

* Considered the user stories and separated nouns into objects and verbs into messages. Compiled short diagrams to explore the interactions between the objects.

* Started with the first user story and worked down consecutively.

* For each user story, prepared feature tests to determine the wording for the unit test. Watched the test fail and then wrote code to make it pass.



```

```


irb example  
-------

$ irb
2.4.0 :001 > require './lib/airport.rb'
 => true
2.4.0 :002 > require './lib/plane.rb'
 => true
2.4.0 :003 > airport = Airport.new

 => #<Airport:0x007fb00a936d10 @weather=#<Weather:0x007fb00a936ce8>, @planes=[], @capacity=100>

2.4.0 :004 > plane1 = Plane.new
 => #<Plane:0x007fb00a92f0d8 @flying=true, @landed=false>

2.4.0 :005 > plane2 = Plane.new
 => #<Plane:0x007fb00a9274f0 @flying=true, @landed=false>

2.4.0 :006 > plane3 = Plane.new
 => #<Plane:0x007fb00a91f980 @flying=true, @landed=false>

2.4.0 :007 > airport.land(plane1)
 => [#<Plane:0x007fb00a92f0d8 @flying=false, @landed=true>]

2.4.0 :008 > airport.land(plane2)
 => [#<Plane:0x007fb00a92f0d8 @flying=false, @landed=true>, #<Plane:0x007fb00a9274f0 @flying=false, @landed=true>]

2.4.0 :009 > airport.land(plane3)
RuntimeError: Storms prevent landing

2.4.0 :010 > airport.land(plane3)
RuntimeError: Storms prevent landing

2.4.0 :011 > airport.land(plane3)
 => [#<Plane:0x007fb00a92f0d8 @flying=false, @landed=true>, #<Plane:0x007fb00a9274f0 @flying=false, @landed=true>, #<Plane:0x007fb00a91f980 @flying=false, @landed=true>]

2.4.0 :012 > airport.take_off(plane2)
 => "#<Plane:0x007fb00a9274f0> has taken off"

2.4.0 :013 > airport
 => #<Airport:0x007fb00a936d10 @weather=#<Weather:0x007fb00a936ce8>, @planes=[#<Plane:0x007fb00a92f0d8 @flying=false, @landed=true>, #<Plane:0x007fb00a91f980 @flying=false, @landed=true>], @capacity=100, @plane=nil>



```
