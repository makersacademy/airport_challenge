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

An example irb transcript is shown below to demonstrate how the app is used. An instance of ControlTower should be used to instruct landings/take-off.

```
2.4.0 :001 > require './lib/control_tower'
 => true
2.4.0 :002 > my_control_tower = ControlTower.new
 => #<ControlTower:0x000000023e7540 @weather=#<Weather:0x000000023e7518>>
2.4.0 :003 > my_plane = Plane.new
 => #<Plane:0x000000023d0048>
2.4.0 :004 > my_airport = Airport.new
 => #<Airport:0x00000002396000 @planes=[], @capacity=20>
2.4.0 :005 > my_control_tower.order_landing(my_plane, my_airport)
 => [#<Plane:0x000000023d0048 @airport=#<Airport:0x00000002396000 @planes=[...], @capacity=20>>]
2.4.0 :006 > my_control_tower.order_take_off(my_plane, my_airport)
 => #<Plane:0x000000023d0048 @airport=nil>
```

## Design
Four classes were created to perform the operations required:

### `ControlTower`
- Capable of sending orders to planes to take off and land at airports.
- Has an instance variable `@weather`.
- Calls methods of other objects when sending instructions.

### `Plane`
- Capable of landing and taking off.
- Has an instance variable `@airport` which stores `nil` if the plane is airborne or an instance of `Airport` if grounded.
- Initialized in the air.

### `Airport`
- Capable of receiving and dispatching planes.
- Has an instance variable `@planes` which stores grounded planes.
- User can specify `@capacity` of instances, otherwise a default of 20 is used.

### `Weather`
- Capable of reporting stormy conditions.
- 10% chance of stormy conditions.

## Testing
The unit tests below all passed with >99% coverage of the code. Edge cases were specifically targeted in addition to tests satisfying the user stories above.

```
Airport
  can create an instance of Airport class
  when receiving planes
    receives a plane successfully
    fails to receive a plane that is already present
    fails to receive a plane when airport is full
  when dispatching planes
    dispatches a plane successfully
    fails to dispatch a plane that is not present

ControlTower
  can create an instance of ControlTower class
  when issuing take-off orders
    issues an order successfully
    fails to issue order in adverse weather
  when issuing landing orders
    issues an order successfully
    fails to issue an order in adverse weather

Plane
  can create an instance of Plane class
  when landing
    lands successfully
    fails to land when already grounded
  when taking off
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
