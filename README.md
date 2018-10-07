# Airport Challenge!

This is my attempt at the Makers Academy Week \#1 weekend challenge.

### User stories

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

### My approach

I tackled this challenge by assuming that the Airport, Plane, and Weather would all be treated as separate units.

I ascertained from the user that the *plane* would be receiving the messages to land, rather than the airport. Therefore, the bulk of the code for this project is contained in the `Plane` class and its associated tests in `plane_spec`.

The weather is determined using the `rand` function that returns a float anywhere between 0 and 1. I set the storm chance to a constant of 0.05, meaning that the `stormy?` method would return `true` roughly 1 in 20 (or 0.05 in 1) times.

The `land` and `take_off` methods inside the `Plane` class take 2 arguments: the `airport` to land in, and the `weather` object. I believe that this approach most accurately follows the user stories, and most accurately represents its real-life counterpart. When a plane is instructed to land, `landing_checks` and `take_off_checks` are executed with the same 2 arguments to account for edge cases relating to the current airport and current weather.

Each plane object has a `location` attribute that defaults to the sky, and when the plane lands is assigned to the current airport object. This protects against an edge case where a plane is asked to land in an airport, when it is already in a *different* airport.

##### Improvements

Currently, improvements could be made relating to the `attr_reader` `landed_planes`. This should not be publicly readable, but for testing purposes and methods inside other classes, I have had to leave it in this state. Given more time, I would refactor my code to have this attribute as private.

### Example

Here is a full story of how my app can be used inside `irb`:

```
$ irb
2.5.0 :004 > airport = Airport.new  
 => #<Airport:0x00007fee9806e5d0 @landed_planes=[], @capacity=20>  
2.5.0 :005 > airport_2 = Airport.new(1)  
 => #<Airport:0x00007fee9805d488 @landed_planes=[], @capacity=1>  
2.5.0 :006 > plane = Plane.new  
 => #<Plane:0x00007fee988cef90 @location=:sky>  
2.5.0 :007 > plane_2 = Plane.new  
 => #<Plane:0x00007fee988b59a0 @location=:sky>  
2.5.0 :008 > weather = Weather.new  
 => #<Weather:0x00007fee98865f18>  
2.5.0 :009 > plane.land(airport, weather)  
 => #<Airport:0x00007fee9806e5d0 @landed_planes=[#<Plane:0x00007fee988cef90 @location=#<Airport:0x00007fee9806e5d0 ...>>], @capacity=20>  
2.5.0 :010 > plane_2.land(airport, weather)  
 => #<Airport:0x00007fee9806e5d0 @landed_planes=[#<Plane:0x00007fee988cef90 @location=#<Airport:0x00007fee9806e5d0 ...>>, #<Plane:0x00007fee988b59a0 @location=#<Airport:0x00007fee9806e5d0 ...>>], @capacity=20>  
2.5.0 :011 > airport.hangar_report  
 => "Planes currently in the hangar: #<Plane:0x00007fee988cef90>, #<Plane:0x00007fee988b59a0>"  
2.5.0 :012 > plane.take_off(airport, weather)  
 => :sky  
2.5.0 :013 > plane_2.take_off(airport, weather)  
 => :sky  
2.5.0 :014 > plane.land(airport_2, weather)  
 => #<Airport:0x00007fee9805d488 @landed_planes=[#<Plane:0x00007fee988cef90 @location=#<Airport:0x00007fee9805d488 ...>>], @capacity=1>  
2.5.0 :015 > plane_2.land(airport_2, weather)  
Traceback (most recent call last):  
        4: from /Users/Joel/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>`  
        3: from (irb):15  
        2: from /Users/Joel/Makers/week1/airport_challenge/lib/plane.rb:9:in `land`    
        1: from /Users/Joel/Makers/week1/airport_challenge/lib/plane.rb:23:in `landing_checks`  
RuntimeError (Airport is full!)  
2.5.0 :016 > plane.location  
 => #<Airport:0x00007fee9805d488 @landed_planes=[#<Plane:0x00007fee988cef90 @location=#<Airport:0x00007fee9805d488 ...>>], @capacity=1>  
2.5.0 :017 > plane.location == airport  
 => false  
2.5.0 :018 > plane.location == airport_2  
 => true  
2.5.0 :019 > plane.take_off(airport_2, weather)  
 => :sky  
2.5.0 :020 > exit
```

Run `irb` in the terminal in order to use the app. Run `rspec` inside the project directory to test the app.
