Airport Challenge
=================

# Makers Academy week 1 weekend challenge

This is a program to control the flow of planes at an airport. It is written in Ruby

This was developed using TDD

## Getting started

`git clone path-to-your-repo`
`command_to_install_dependencies` (e.g. `bundle`)

## Usage

`command_to_start` (e.g. `rackup` or `rails s`)
Navigate to `http://localhost:4567/`


## Running tests

- RSpec
`test_command` => `rspec`

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

## Design of program:

Domain Model:

| Object        | Messages                                            |
| ------------- |:----------------------------------------------------|
| Airport       | land(plane), take_off(plane), check_airport_full,
                  capacity, check_weather, plane_in_airport?(plane)   |
| Plane         | land_at(airport), fly, in_airport?(airport)         |
| Weather       | stormy?                                             |

class: Airport

class: Plane

module: Weather
