# Airport Challenge

```ruby
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

## Task

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it is stormy, in which case no planes can land or take off.

### User Stories

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

### Functional Representation

Objects  | Messages
------------- | -------------
Plane  | 
Weather | stormy?
Airport | tell_to_land(plane), tell_to_takeoff(plane)


## Interface
The expected interface for this airport to use is IRB. The following notes and accompanying code explain how to interact with the program.

Getting started:
```ruby
require './lib/airport.rb'
```

There is a 1-in-5 chance of a storm:
```ruby
weather = Weather.new
weather.stormy?
=> false
```

Creating a new plane:
```ruby
plane = Plane.new
```

An airport can have a specific maximum capacity if required, otherwise it's just instantiated with a default capacity of 1. 
```ruby
airport_default = Airport.new
airport_large = Airport.new(100)
```

The airport can instruct a plane to land as long as the weather is sunny. The airport will raise an error if there is no space left in the hangar:
```ruby
airport.tell_to_land(plane)
```

The airport can instruct a plane to take off as long as the weather is sunny. The airport will return 0 if the plane is not located:
```ruby
airport.tell_to_takeoff(plane)
```

## Testing

You can run the associated tests using Rspec:
```ruby
rspec
```

## Tech Stack

Technologies used:

- Ruby
- Rspec for testing
- Simplecov for assessing test coverage
- Rubocop for linting
