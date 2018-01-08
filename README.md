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

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

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

##This software does the following:
    -does not allow plane to take off if weather is stormy
    -lands a plane at airport
    -take off a plane from airport
    -raises error if airport is empty
    -raises error if plane that is taking off is not at the airport
    -raises error if airport is full
    -checks if plane is at the airport
    -does not allow plane to land if weather is stormy
    -checks if plane is flying

##Approach
   -Research about rspec
   -Writing down and breaking down the requirements
   -Steps to follow to full fill the requirements

  ##How this app works:
  2.4.1 :002 > airport = Airport.new
 => #<Airport:0x007fb6830fc2d8 @planes=[], @capacity=1, @weather=#<Weather:0x007fb6830fc2b0>>
2.4.1 :003 > plane = Plane.new
 => #<Plane:0x007fb6830f4808 @flying=true>
2.4.1 :004 > airport.land(plane)
 => #<Plane:0x007fb6830f4808 @flying=true>
2.4.1 :005 > airport
 => #<Airport:0x007fb6830fc2d8 @planes=[#<Plane:0x007fb6830f4808 @flying=true>], @capacity=1, @weather=#<Weather:0x007fb6830fc2b0>>
2.4.1 :006 > airport.take_off(plane)
 => []
2.4.1 :007 > airport
 => #<Airport:0x007fb6830fc2d8 @planes=[], @capacity=1, @weather=#<Weather:0x007fb6830fc2b0>>
2.4.1 :008 > airport.take_off(plane)
RuntimeError: Airport is empty.
	from /Users/reenasharma/makers/weekendChallenge-1/airport_challenge/lib/airport.rb:27:in `take_off'
	from (irb):8
	from /Users/reenasharma/.rvm/rubies/ruby-2.4.1/bin/irb:11:in `<main>'
2.4.1 :009 > airport.land(plane)
 => #<Plane:0x007fb6830f4808 @flying=true>
2.4.1 :010 > plane2 = Plane.new
 => #<Plane:0x007fb6830c4f68 @flying=true>
2.4.1 :011 > airport.land(plane2)
RuntimeError: Cannot land as airport is full
	from /Users/reenasharma/makers/weekendChallenge-1/airport_challenge/lib/airport.rb:16:in `land'
	from (irb):11
	from /Users/reenasharma/.rvm/rubies/ruby-2.4.1/bin/irb:11:in `<main>'
2.4.1 :012 > plane3 = Plane.new
 => #<Plane:0x007fb6830b4cd0 @flying=true>
2.4.1 :013 > airport.land(plane3)
RuntimeError: Cannot land as airport is full
	from /Users/reenasharma/makers/weekendChallenge-1/airport_challenge/lib/airport.rb:16:in `land'
	from (irb):13
	from /Users/reenasharma/.rvm/rubies/ruby-2.4.1/bin/irb:11:in `<main>'
2.4.1 :014 > airport.take_off(plane2)
RuntimeError: This plane is not at the airport
