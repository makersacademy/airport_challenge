# Airport Challenge

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



## Introduction
The purpose of this repository is to satisfy the user stories listed below. The code was developed using TDD to design and implement new features as required.

## User Stories
The client has requested software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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

## Getting Started
Clone this repository and run `bundle` in terminal.

An example irb transcript is shown below to demonstrate how the app is used:

```
2.4.0 :001 > require './lib/airport'
 => true
2.4.0 :002 > my_plane = Plane.new
 => #<Plane:0x000000016a2ee8>
2.4.0 :003 > my_airport = Airport.new
 => #<Airport:0x0000000167b708 @planes=[], @capacity=20>
2.4.0 :004 > my_plane.land(my_airport)
 => #<Airport:0x0000000167b708 @planes=[#<Plane:0x000000016a2ee8 @airport=#<Airport:0x0000000167b708 ...>>], @capacity=20>
2.4.0 :005 > my_plane.take_off
 => nil
2.4.0 :006 > my_plane
 => #<Plane:0x000000016a2ee8 @airport=nil>
2.4.0 :007 > my_airport
 => #<Airport:0x0000000167b708 @planes=[], @capacity=20>
 2.4.0 :008 > 20.times { Plane.new.land(my_airport) }
 => 20
```

## Design
Three classes were created to perform the operations required:

### `Plane`
- Capable of landing and taking off.
- Has an instance variable `airport` which stores `nil` if the plane is airborne or an instance of `Airport` if grounded.
- Initialized in the air.
- Calls `Airport` methods when landing/taking off to manipulate the airport's instance variables.

### `Airport`
- Capable of receiving and dispatching planes.
- Has an instance variable `planes` which stores grounded planes.
- User can specify `capacity` of instances, otherwise a default of 20 is used.
- Doesn't call `Plane` methods (to avoid circular referencing). If the Airport's methods are called, the plane's instance variable will be unchanged. Ideally an additional class should be created to mediate between the `Plane` and `Airport` classes.

### `Weather`
- Capable of reporting stormy conditions.
- 10% chance of stormy conditions.

## Testing
The unit tests below all passed with >99% coverage of the code. Edge cases were specifically targeted in addition to tests satisfying the user stories above.

```
Airport
  can create an instance of Airport class
  in clear weather
    receives a plane successfully
    fails to receive a plane that is already present
    fails to receive a plane when it is full
    dispatches a plane successfully
    fails to dispatch a plane that is not present
  in stormy weather
    fails to dispatch a plane
    fails to receive a plane

Plane
  can create an instance of Plane class
  lands successfully
  fails to land when already grounded
  takes off successfully
  fails to take off when already airborne

Weather
  can create an instance of the Weather class
  with randomness stubbed
    reports stormy conditions
    reports clear conditions
```

## Next steps
- Refactor RSpec unit tests to eliminate repetition of stubbing and mocking.
- Write RSpec feature tests.
- Reduce exposure of instance variables on classes.
- Implement a "mediation" class to handle interactions between Airport and Plane classes.
