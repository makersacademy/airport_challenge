# Airport Challenge

``````
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)
``````

## Overview

- This the the Makers Academy week 1 weekend challenge

## Run The Code

1. Clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. Run the command `rspec` to run the tests
5. Run the command `rubocop` to check code styling infringements

## User Stories

The software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. Here are the user stories that we worked out in collaboration with the client:

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

## Test Drive the Code

An example of test-driving the code would be:

1. Require the Airport class
2. Require the Plane class
3. Create an airport
4. Create a plane that is grounded
5. Ask the plane to take off
6. Land the plane at the airport
7. Take off from the airport

```ruby
2.5.0 :001 > require './lib/airport'
 => true
2.5.0 :002 > require './lib/plane'
 => true
2.5.0 :003 > airport = Airport.new
 => #<Airport:0x00007fa753816eb8 @capacity=100, @planes=[], @weather=#<Weather:0x00007fa753816e90>>
2.5.0 :004 > plane = Plane.new
 => #<Plane:0x00007fa7538284d8 @status=:grounded>
2.5.0 :005 > plane.take_off
 => :flying
2.5.0 :006 > airport.land(plane)
 => true
2.5.0 :007 > airport.take_off(plane)
 => #<Plane:0x00007fa7538284d8 @status=:flying>
```

## Approach to the problem

Initially, I took the approach of the `Plane` being the central entity. The idea being that, as a user, you would instruct the `plane` to take off from an `airport` or land at an `airport`. This initially required the `Plane` to track the `Weather` and the `airport` that it had landed at. This worked for a while but once I started modelling the `Airport` capacity it started to feel a bit clunky.

At this point, I had a peak at the review document and saw that the `Airport` was the central entity and was responsible for landing and taking off `plane`s. Whilst I'm not fully comfortable with this (because, in real life, a plane would ask for clearance and take off and then inform air traffic control that it had taken off and left the airport) I can see that it makes the code simpler, so I reworked my tests and code to switch the main responsibilities from the `Plane` to the `Airport`. This took some time and I'd already invested a few hours getting this far.

At the moment, when an operation is not allowed, I raise an error from the code because that is what we have been shown to do so far. I'm not sure that is the best way handle this. My newness to Ruby means that I don't know if this is the best approach, or not. Raising errors is quite abrupt. It may be better to return a value instead. I'll explore some option when I get the chance.

## Further Work

I'd like to write some RSpec **feature** tests that lands and takes off a number of planes. This would encounter variable weather conditions and the possibility of the airport being full.
