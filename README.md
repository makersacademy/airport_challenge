# Airport Challenge (Makers Academy Weekend Challenge #1)
=================  
A basic sandbox simulating airport ground control.

## Contents
/lib  
controller.rb  
airport.rb  
plane.rb  
weather.rb  

/spec  
controller_spec.rb  
airport_spec.rb  
plane_spec.rb  
weather_spec.rb

## Getting Started

1) Clone or download and unzip repository.   
`git clone https://github.com/TomJamesDuffy/airport_challenge.git`   

2) Access the directory and load 'airport.rb' in irb, pry or other ruby REPL.   
`require './lib/airport.rb'`

## Instructions for use

There are four elements to the simulation - controllers, airports, planes and weather.

To make any one of these use the standard object creation format.

`[object name] = Object.new`

Planes must be initialised with an airport argument.


**Controller**  
*Controller: “Captain, maybe we ought to turn on the search lights now.” Kramer: “No… that’s just what they’ll be expecting us to do.”*

Controllers provide approval for flights to take_off and land. Approval will only be granted if the weather is sunny.

`controller.flight_approval(plane, weather)`    
`controller.land_approval(plane, weather, airport)`

Controllers can also get the status of planes at any time.

`controller.request_status(plane)`

**Weather**  
*McCroskey: “It sure is quiet out there.” Kramer: “Yeah, too quiet.”*

Weather, when instantiated will be either sunny or stormy. Used by the controller when allocating approval.

`Weather.new.current`

**Airport**  
*Ted: “Let’s see. Altitude 24,000 feet. Level flight. Speed 520 knots. Course, zero niner zero. Trim and mixture: wash, soak, rinse, spin…”*

On initialisation the capacity of an airport can be stated. If no capacity is stated the default capacity will be set at 10. Airports cannot dock more than their capacity.

`airport = Airport.new()`  
`airport = Airport.new(20)`

**Plane**  
*Ted: “Surely, there must be something you can do.” Dr. Rumack: “I’m doing everything I can. And stop calling me Shirley.”*

Planes must be granted approval prior to take off and landing. If not it will not be permitted.

`plane.take_off`  
`plane.land(airport)`  

## Testing

Tests were designed and run using the RSpec framework. To install the rspec gem:  
`gem install rspec`  

To run Rspec:   
`rspec`

## Domain Modelling

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```

| object | message |
|--|--|
|airport| docks plane|
|plane| lands |
|controller| provides instruction|

```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

| object | message |
|--|--|
|airport| releases plane|
|plane| takes off |
|controller| provides instruction|

```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```

| object | message |
|--|--|
|weather| stormy |
|controller| prevent take off (stormy)|

```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```

| object | message |
|--|--|
|airport| capacity|
|controller| prevent take off (capacity)|


```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

| object | message |
|--|--|
|airport| default capacity|
|user| ability to overide |
