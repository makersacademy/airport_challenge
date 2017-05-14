Airport Challenge
=================
[![Build Status](https://travis-ci.org/makersacademy/airport_challenge.svg?branch=master)](https://travis-ci.org/makersacademy/airport_challenge)

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




Software created with Ruby.

Allows Air Traffic Controllers to manage the takeoff and landing of planes to and from airports. Weather is variable, and planes cannot land at or take off from airports which are stormy. By checking for updates on the weather, a controller can determine when it is safe for a plane to land.

Example case
------------
```
2.2.3 :001 > require './docs/airport.rb'
 => true
2.2.3 :002 > boeing = Plane.new "Boeing 747"
 => #<Plane:0x007fe34b10ea60 @name="Boeing 747", @airborne=true>
2.2.3 :003 > heathrow = Airport.new "Heathrow"
 => #<Airport:0x007fe34b0a4138 @name="Heathrow", @hangar=[], @capacity=5, @weather=:stormy>
2.2.3 :004 > heathrow.land(boeing)
RuntimeError: Plane cannot land in stormy conditions
2.2.3 :005 > heathrow.check_weather
 => :clear
2.2.3 :006 > heathrow.land(boeing)
 => [#<Plane:0x007fe34b10ea60 @name="Boeing 747", @airborne=false>]
2.2.3 :007 > heathrow.hangar
 => [#<Plane:0x007fe34b10ea60 @name="Boeing 747", @airborne=false>]
 2.2.3 :008 > heathrow.check_weather
 => :stormy
 2.2.3 :009 > heathrow.take_off(boeing)
RuntimeError: Plane cannot take off in stormy conditions
2.2.3 :010 > heathrow.check_weather
 => :clear
2.2.3 :011 > heathrow.take_off(boeing)
 => true
2.2.3 :012> heathrow.hangar
 => []
2.2.3 :013 > boeing
 => #<Plane:0x007fe34b10ea60 @name="Boeing 747", @airborne=true>
```


Possible improvements
----------

Rewrite take_off function to return error for plane not being in hangar even if it is stormy.

Write test case to ensure a plane can land after check_weather returns clear weather.

Currently fails:

'''it 'expects a plane to land if the weather clears' do
  allow(airport).to receive(:weather).and_return(:stormy)
  allow(airport).to receive(:check_weather).and_return(:weather => :clear)
  expect(airport.land(airbus)).not_to raise_error('Cannot land plane: condition is stormy. Check weather for update')
end
'''

Error:

'''Failures:

  1) Airport expects a plane to land if the weather clears
     Failure/Error: airport.land(airbus).stormy? == false
     RuntimeError:
       Cannot land plane: condition is stormy. Check weather for update
     # ./docs/airport.rb:16:in `land'
     # ./spec/airport_spec.rb:60:in `block (2 levels) in <top (required)>'
     '''




User Stories
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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
