# Airport Challenge

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

## Task

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

## Code style

- OOD
- TDD

## Tech Used

- RSpec
- Ruby

## Features

You'll be able to:

- Create new plane
- Fly a plane
- Land a plane
- Generate plane
- You'll be given an error:
  - If you try to make a plane take off when the airport is empty
  - If you try to make a plane that isn't in an airport take off
  - If you try take off during a storm
  - If you try to make a plane land when the airport is full
  - If you try to make a plane that has already landed land
  - If you try land during a storm


## Getting Started

This programme is used in the terminal.

## Local Setup

```sh
$ git clone https://github.com/kealanheena/airport_challenge.git
```

```sh
$ cd airport-challenge
```

#### To Start

- Run "ruby  airport.rb" file in terminal.

## Running the tests

You can run tests by running "rspec" in airport file.

### Tests 

### Airport Class

- #land
  - should store the plane in the airport
  - gives an error if capacity is full
  - gives an error if capacity 25 when an argument of 25 is passed
  - gives an error if capacity 15 when an argument of 15 is passed
  - gives an error if you try to land the same plane twice
  - gives an error if you try to land during a storm


## Versioning

"airport-challenge" is using ruby version 2.6.3, to change ruby versions run "rvm install ruby-2.6.3" in terminal.
