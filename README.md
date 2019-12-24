# Airport Challenge

## Description

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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

## Installation

- Fork this repo, and clone to your local machine
- Run the command `gem install bundle` (if you don't have bundle already)
- When the installation completes, run `bundle`
- $ irb -r ./lib/Airport.rb -r ./lib/Plane.rb -r ./lib/Weather.rb

## Usage
Once you have run in the irb, you are able to carry out the given methods for airport functionality, for example landing and taking off a plane, checking to see if the plane is working, and checking the weather status.

## Technologies used
- Ruby
- Travis
- Rubocop
- RSpec
- simplecov

## Project status
The project is complete but can do with some refactoring. Could also be further developed to include a front-end interface.
