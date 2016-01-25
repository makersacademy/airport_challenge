Airport Challenge
=================

This is the Week 1 Airport Challenge by Zeshan Rasul.

I began the project taking the user stories listed below as direction.

```
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

I decided to create three classes: 'airport', 'plane' and 'weather'.  I make corresponding spec files for testing purposes: 'airport_spec', 'plane_spec' and 'weather_spec', as well as a 'feature_spec', to show features that come about from multiple planes operating in the system.

I have included a pry transcript of application set up, where an Airport is created with default capacity and the initial weather set up.  A plane is created which then can be landed at the airport, and will be included in it's array of 'planes_landed'.

```
[1] pry(main)> require './lib/airport.rb'
=> true
[2] pry(main)> require './lib/plane.rb'
=> true
[3] pry(main)> airport = Airport.new(Weather)
=> #<Airport:0x007feda1abd088 @capacity=20, @planes_landed=[], @weather=Weather>
[4] pry(main)> plane = Plane.new
=> #<Plane:0x007feda21690a8 @at_airport=false, @in_air=true>
[5] pry(main)> airport.land(plane)
#<Plane:0x007feda21690a8> has landed
=> #<Plane:0x007feda21690a8
 @airport=#<Airport:0x007feda1abd088 @capacity=20, @planes_landed=[#<Plane:0x007feda21690a8 ...>], @weather=Weather>,
 @at_airport=true,
 @in_air=false,
 @not_in_air=true>
[6] pry(main)> airport.take_off(plane)
RuntimeError: Cannot take off in stormy conditions
```

As you can see above,  both planes and airports can be initialized once the files have been required in IRB.  After this, users are able to land planes at airports, and able to see the status of planes, including whether they are in the air or at airports.  Airports are initialized with a default capacity of twenty planes, although this can be changed when initialized. To maintain a realistic nature, this cannot be changed after initialization.  

The weather class has included a stormy? method, which will result to true 25% of the time.  When it does return true, the weather will be set to stormy at the airport.  This will mean that no planes are able to land or take off until the weather returns to not stormy again.

There are a number of tests to ensure that airports cannot exceed their capacity, that planes can only land or take off when in the air or on the ground respectively and that errors are raised when these limitations arise in the application.

Further work could be done on expanding weather conditions and also integrating further realistic features, such as flight delays as a result of too many planes using an airport on any given day.  

A passengers class could also be created which would add a further dimension.  With passengers boarding and disembarking flights at the airports.
