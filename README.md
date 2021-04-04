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

```

**Airport** models and controls the flow of planes at an airport. The planes can land and take off provided that there is spare capacity at the airport and that the weather is not stormy. The weather is set using a random number generator. 

This program was built  using **TDD** as part of [**Makers Academy Coding Bootcamp's**]([http://makers.tech](http://makers.tech/)) Airport Challenge (from which this repository was forked on 2021-April-04).

In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

Your code should defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.

## Installation

This program is designed to be run from [irb](https://en.wikipedia.org/wiki/Interactive_Ruby_Shell) (or a similar interactive Ruby environment).  This requires Ruby (recommended version 3.0.0) - which will give you access to irb. If you are unsure if you have Ruby installed, or need help seeing the version you are using [codecademy](https://www.codecademy.com) provide this useful guide to [**setp Ruby**](https://www.codecademy.com/articles/ruby-setup). 

## Usage

```bash
# open irb
irb -r ./lib/airport -r ./lib/plane
# create an airport
irb(main):001 > london_stansted = Airport.new
# create a plane
irb(main):002 > BA001 = Plane.new
# land the plane at the airport
irb(main):003 > london_stansted.land(BA001)
# check if the plane is in the airport
irb(main):004 > london_stansted.hangar?(BA001)
 => true
# have the plane take off from the airport
irb(main):005 > london_stansted.take_off(BA001)
# check if the plane is in the airport
irb(main):006 > london_stansted.hangar?(BA001)
 => false

```

## Running Tests

```bash
# To run tests
rspec
```

## Development / Contributing

This project was created as a learning exercise as part of the Makers Academy Coding Bootcamp. 

No further development is planned on this project and pull requests are not sought (sorry🤗).

User Stories
-----

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

## Domain Model

| Objects                | Messages                                                     |
| ---------------------- | ------------------------------------------------------------ |
| air traffic controller |                                                              |
| passengers             |                                                              |
| destination            |                                                              |
| plane                  |                                                              |
| airport                | land(plane)<br />take_off(plane)<br />hangar?(plane)<br />full?<br />change_capacity(new_capacity) |
| weather                | stormy?                                                      |



