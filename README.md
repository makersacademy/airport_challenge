# Airport Challenge [![Coverage Status](https://coveralls.io/repos/github/blessingaliu/airport-challenge/badge.svg?branch=main)](https://coveralls.io/github/blessingaliu/airport-challenge?branch=main)

## Weekend 1 Challenge at Makers Academy

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

Main Task
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

## Quickstart

First, you will need to clone the repository, change the directory and install the dependencies in order to run it:

```
git clone https://github.com/blessingaliu/airport-challenge
cd airport-challenge
bundle install 
#installing dependencies
```

Then you would need to just use irb using `irb -r './lib/airport.rb'`


## Tech Stack

Here is a list of the technologies used:

- Ruby 3.0.2
- Rspec to testing
- Simplecov for testing coverage
- Rubocop to maintain styling
