# Airport Challenge

## Overview

This implementation  of the challenge is based on the idea of planes requesting to land and take off from airports. When a plane and an airport are created the user will instruct a plane to `land_at` a specific airport and `depart` from it. The `depart` method does not take an argument because a plane can only ever be in one airport, the airport it last docked at. Edge case checking is then done by the plane which then sends a request to the airport to dock or take off which will answered either with an affirmative or an error. Because planes keep track of what airport they are in and always depart from that airport this removes a lot of issues like planes teleporting between airports or airports containing planes that are also in another airport.

I made the assumption that when planes are first created they are *already* flying. This alleviated a lot of problems in terms of having to already have an airport in existence when a plane was created and having to dock it automatically for every new plane. Currently when the user creates a plane they will have to manually dock it if they want it to start off in an airport.

## Example IRB usage

```
$irb
2.6.5 :001 > plane = Plane.new
 => #<Plane:0x00007fbbc48b6488 @state=true>
2.6.5 :002 > airport = Airport.new
 => #<Airport:0x00007fbbc5088148 @planes=[], @capacity=10, @weather_reporter=#<WeatherReporter:0x00007fbbc50880d0>>
2.6.5 :003 > plane.land_at(airport)
 => [#<Plane:0x00007fbbc48b6488 @state=false, @port=#<Airport:0x00007fbbc5088148 @planes=[...], @capacity=10, @weather_reporter=#<WeatherReporter:0x00007fbbc50880d0>>>]
2.6.5 :004 > plane.flying?
 => false
2.6.5 :0005 > plane.depart
 => nil
2.6.5 :006 > plane.flying?
 => true
```

## Development

Below are the user stories for this project
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```

### Object Domain Model

This is the object domain model derived from the above user stories.

| Object | Message |
| ---   | --- |
| Plane | land_at(airport) |
| | depart  |
| | flying? |
| | @port |

| Object | Message |
| ---   | --- |
| Aiport | dock(plane) |
| | undock(plane) |
| |docked?(plane)    |
| | @capacity |
| | full? |
| | ::DEFAULT_CAPACITY |

| Object | Message |
| ---   | --- |
| WeatherReporter | check_weather |

### Tests

#### Airport
- planes
  - [x] Responds to planes
  - [x] @planes is an instance of an Array
- dock(plane)
  - [x] Responds to dock with 1 argument
  - [x] Adds a plane to @planes
  - [x] Raises an error when its stormy
- undock(plane)
  - [x] Responds to undock with 1 argument
  - [x] Removes a plane from @planes
  - [x] Raises an error when its stormy
- docked?(plane)
  - [x] Responds to docked? with 1 argument
  - [x] Returns true if plane IS in dock
  - [x] Returns false if plane IS NOT in dock
- full?
  - [x] Responds to full?
  - [x] Returns a boolean
  - [x] Returns true when airport is at maximum capacity
  - [x] Returns false if airport is under capacity
- capacity
  - [x] Responds to capacity
  - [x] Returns and integer
  - [ ] Capacity can't be less than 1

#### Plane
- land_at(airport)
  - [x] Responds to land_at with 1 argument
  - [x] Changes @state to be false
  - [x] Changes @port to be an instance equal to airport
  - [x] Call dock method on airport
  - [x] Cannot land when it has already landed
  - [x] Cannot land if the airport is full
- depart
  - [x] Responds to depart
  - [x] Changes flying? to be true
  - [x] Call undock method on airport
  - [x] Cannot depart from a different airport than the one it is in
  - [x] Cannot depart while already flying
- port
  - [x] Responds to port
- flying?
  - [x] It responds to flying
  - [x] It returns a bool
  - [x] It starts as not flying

#### WeatherReporter
- check_weather
  - [x] Responds to check_weather
  - [x] Returns a String
  - [x] Returns Sunny when the Weather is sunny
  - [x] Returns Stormy when the Weather is stormy
