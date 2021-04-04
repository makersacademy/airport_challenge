Airport
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)
                                    ________________________________________________________
```

**Airport** models and controls the flow of planes at an airport. The planes can land and take off provided that there is spare capacity at the airport and that the weather is not stormy. The weather is set using a random number generator. 

This program was built  using **TDD** as part of [**Makers Academy Coding Bootcamp's**]([http://makers.tech](http://makers.tech/)) Airport Challenge (from which this repository was forked on 2021-April-04).

In my tests I use **doubles** so one class spec is not testing against another class. I also use **stubs** to override random weather and ensure consistent test behaviour.

## Installation

This program is designed to be run from [irb](https://en.wikipedia.org/wiki/Interactive_Ruby_Shell) (or a similar interactive Ruby environment) and requires **Ruby version 2.6.5** - which will give you access to irb. If you are unsure if you have Ruby installed, or need help seeing the version you are using [codecademy](https://www.codecademy.com) provide this useful guide to [**setup Ruby**](https://www.codecademy.com/articles/ruby-setup). 

## Usage

```bash
# open irb
irb -r ./lib/airport -r ./lib/plane
# create an airport
irb(main):001 > shoreditch_airfield = Airport.new
# create a plane
irb(main):002 > MA001 = Plane.new
# land the plane at the airport
irb(main):003 > shoreditch_airfield.land(MA001)
# check if the plane is in the airport
irb(main):004 > shoreditch_airfield.hangar?(MA001)
 => true
# have the plane take off from the airport
irb(main):005 > shoreditch_airfield.take_off(MA001)
# check if the plane is in the airport
irb(main):006 > shoreditch_airfield.hangar?(MA001)
 => false
# change the capacity at the airport
irb(main):007 > shoreditch_airfield.change_capacity(35)

```

Design
-----

### User Stories

Below are the user stories as worked out in collaboration with the client (these were provided in the challenge):

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

### Edge Cases

The code also defends against a number of edge cases including:

* planes can only take off from airports they are in
* planes that are already flying cannot take off
* planes that are already flying cannot be in an airport
* planes that are landed cannot land again
* planes that are landed must be in an airport

### Domain Model

| Objects | Messages                                                     |
| ------- | ------------------------------------------------------------ |
| plane   |                                                              |
| airport | land(plane)<br />take_off(plane)<br />hangar?(plane)<br />change_capacity(new_capacity)<br />full? |
| weather | stormy?                                                      |

## Running Tests

```bash
# To run tests
rspec
```

## Development / Contributing

This project was created as a learning exercise as part of the Makers Academy Coding Bootcamp. 

No further development is planned on this project and pull requests are not sought (sorry🤗).

