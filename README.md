# Airport Challenge - Makers Academy Weekend Challenge 1

Our first weekend challenge. A small sandbox environment to simulate an airport.

## Aim
I began this challenge by breaking the user stories down, one at a time. I managed to get the basic functionality running, however unfortunately ran out of time to complete all of the additional requirements.

#### Still To Do
- [ ] Ensure planes are not duplicated im airport
- [ ] Update plane status accordingly
- [ ] Add feature to take off a number of planes at a time
- [ ] Add domain modeling breakdown in readme

## Contents
```
lib
|--- airport.rb
|--- plane.rb
|--- weather.rb
|
spec
|--- airport_spec.rb
|--- plane_spec.rb
|--- weather_spec.rb
```

## Getting started
1. Clone the repository to your system
2. Redirect into the parent directory ie. ` cd /projects/airport-challenge `
3. Run IRB or and other Ruby REPL
4. Load in the file airport.rb to get started `require ''./lib/airport.rb'`


## Instructions

There are 3 main components to this code base. airport, planes and the weather.

To create these, use the standard object creation format.

`airport = Airport.new`
`plane = Plane.new`
`weather = Weather.new`

Capacity of the airport can be modified by specifying the number of planes when initialising the airport object

`airport = Airport.new(20)`

## Testing
Tests were designed and run using the RSpec framework. To install the RSpec gem:
`gem install rspec`

To run RSpec:
`rspec`


## User Stories

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
