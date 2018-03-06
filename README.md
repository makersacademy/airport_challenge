# Airport Challenge :airplane:
**Makers Academy - Weekend Challenge 1**

Our first weekend challenge was to create a small sandbox environment to simulate a small airport.

## Aim
I began this challenge by breaking the user stories down, one at a time. I managed to get the basic functionality running, however unfortunately ran out of time to complete all of the additional requirements.

#### To Do
- [ ] Ensure planes are not duplicated in airport
- [x] Update plane status accordingly
- [ ] Add feature to take off a number of planes at a time
- [ ] Add domain modeling breakdown in readme

##  File Contents
```
project
|
|--lib
|  |-- airport.rb
|  |-- plane.rb
|  |-- weather.rb
|
|--spec
|  |-- airport_spec.rb
|  |-- plane_spec.rb
|  |-- weather_spec.rb
```

## Getting started
1. Clone the repository to your system
2. Redirect into the parent directory ie. `cd /projects/airport-challenge `
3. Run IRB or and other Ruby REPL
4. Load in the file airport.rb to get started `require './lib/airport.rb'`


## Instructions

There are 3 main components to this code base. airport, planes and the weather.

To create these, use the standard object creation format.

```
airport = Airport.new
plane = Plane.new
weather = Weather.new
```

Capacity of the airport can be modified by specifying the number of planes when initializing the airport object.

`airport = Airport.new(20)`

## Example IRB Usage
```
2.5.0 :001 > airport = Airport.new(5)
 => #<Airport:0x00007ffa9e13b0f0 @hangar=[], @capacity=5>

 2.5.0 :002 > plane = Plane.new
 => #<Plane:0x00007ffa9e132900 @status="flying">

 2.5.0 :003 > weather = Weather.new
 => #<Weather:0x00007ffa9e116bd8>

 2.5.0 :004 > airport.land(plane, weather)
  => [#<Plane:0x00007ffa9e132900 @status="flying">]

 2.5.0 :005 > airport.inspect
  => "#<Airport:0x00007ffa9e13b0f0 @hangar=[#<Plane:0x00007ffa9e132900 @status=\"flying\">], @capacity=5>"

2.5.0 :006 > airport.take_off(plane, weather)
  => #<Plane:0x00007ffa9e132900 @status="flying">

2.5.0 :007 > airport.inspect
  => "#<Airport:0x00007ffa9e13b0f0 @hangar=[], @capacity=5>"
```

## Testing
Tests were designed and run using the RSpec framework.

To install the RSpec gem:
`gem install rspec`

To run RSpec test:
`rspec`


## User Stories
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
|  Objects | Messages |
| --- | --- |
| Airport | land(plane, weather)
| Airport | take_off(plane, weather)
| Plane |  change_status

```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```

|  Objects | Messages |
| --- | --- |
| Airport | take_off(plane, weather)
| Weather | stormy?
Plane |  change_status

```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```

|  Objects | Messages |
| --- | --- |
| Airport | land(plane, weather)
| Airport | hangar_capacity_reached?
Weather | stormy?
Plane |  change_status

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
|  Objects | Messages |
| --- | --- |
| Airport::DEFAULT_CAPACITY | Airport.new(20)
