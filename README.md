[![Build Status](https://travis-ci.com/kerisic/airport_challenge.svg?branch=master)](https://travis-ci.com/kerisic/airport_challenge)
# Airport Challenge

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. Here are the user stories that we worked out in collaboration with the client.

```bash
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
So that the software can be used by many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 

```
## Description

Our app allows the `Airport` object to instruct a `Plane` object to `land` or `take_off`. Once landed, the `Plane` is stored in an array within the `Airport`; once taken off, it is removed from the array.

When the `Airport` invokes the `land` or `take_off` methods, it checks the weather by instructing its weather instance variable (created from the `Weather` class) to determine if it is `stormy?`. If it returns `true`, it raises an error to prevent the `Plane` to land or take off due to stormy weather conditions.

`Airport` objects have a default capacity of `10`. System designers can override the default by using `override_capacity`.


## Installation

1. Fork this repo and clone to your local machine.
2. Run the command `gem install bundle`
3. Run `bundle`

## Usage

```ruby
plane = Plane.new # creates a new Plane
airport = Airport.new # creates a new Airport

airport.land(plane) # lands the plane at the airport
airport.take_off(plane) # instructs the plane to take-off

airport.override_capacity(5) # overrides an airport's default capacity from 10 to the argument
```
