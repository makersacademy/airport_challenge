# Airport Challenge
This app helps manage the flow of planes at an airport.

## Task
To write software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  

## How do I run it
##### Download the app
```
$ git clone git@github.com:LazySamir/airport_challenge.git
$ cd airport_challenge
$ bundle
```
#### How do I use it?

Run irb and require the classes.
```
$ irb
$ require "./lib/airport.rb"
$ require "./lib/plane.rb"
```

Create instances of planes and airports (with a hanger capacity of three planes)
```
$ airport = Airport.new(3)
$ airport2 = Airport.new(3)
$ plane = Plane.new
$ plane2 = Plane.new
```

Planes can land and take_off when the weather is good:
`$ plane.land(airport, true)`
`$ plane.take_off(airport, true)`

Planes can not land and take_off when the weather is bad:
`$ plane.land(airport, false)`
`$ plane.take_off(airport, false)`


#### How do I run the tests?
`$ rspec`

### User Stories
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
