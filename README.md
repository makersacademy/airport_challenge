![Build Status](https://travis-ci.org/sophieklm/airport_challenge.svg?branch=master)

Airport
=================

This challenge uses Ruby and RSpec to model the flow of planes in an airport following the user stories below. This uses a set of classes and modules with mocks for testing, and a random number generator to create storms, using stubs to override random weather for testing.

How to use
---------

Clone the repository and cd into it.

Use IRB and require './lib/airport.rb' and './lib/plane.rb'

Create new objects with:

```shell
> plane = Plane.new
> airport = Airport.new
```

Land planes or allow a plane to take off with:

```shell
> airport.land(plane)
> airport.take_off
```

Check if a plane is landed or change its status:

```shell
> plane.landed?
> plane.landed
> plane.flying
```

Check if the weather is stormy or create a new day to change the weather:
```shell
> airport.stormy?
> airport.new_day
```

User Stories
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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
