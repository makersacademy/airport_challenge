# AIRPORT CHALLENGE

This is my response to the 'weekend challenge' of Week 1 of Makers Academy. For full details of what the challenge involved, see 'APPENDIX' below.

## Getting started

1) `git clone path-to-your-repo`
2) `gem install bundle`

## Usage

Instructions are for Terminal on Mac OS
1) `irb`
2) `require './lib.airport.rb'`

* Airport and Plane objects must be instantiated by using `Airport.new` and `Plane.new`.
* Planes are airborne by default when instantiated.
* The default capacity of airports is 20 which can be changed by supplying an * optional argument to `Airport.new`.
* Stormy weather prevents planes taking off but not landing.
* There is a .01 probability of stormy weather at each attempted take off.

## Running tests

Run `rspec`

99.10% test coverage. One line untested is the redundant `stormy?` method (see Notes).

## Notes

* #stormy? in the `Airport` class is redundant. `stormy?` should be called on a new `Weather` object. I could not see how I could create a method stub within `airport_spec.rb` to mock the weather object responding to `stormy?`.


## APPENDIX


Airport Challenge
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

Task
-----

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

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.
