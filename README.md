# Airport Challenge
=================

/gitlab/coverage/:user/:repo/:branch

_Makers Academy Software Developer Bootcamp Week 3: Individual Challenge_

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

## What is the project?

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  

Here are the *user stories* that we worked out in collaboration with the client:

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

## Project Objectives

### Program Functionality
- [x] A plane can land at an airport
- [x] A plane can take off from an airport and confirm it is no longer at the airport
- [x] A plane cannot land when the airport is full
- [x] Airports have a default capacity which can be overridden
- [x] A plane cannot take off when the weather is stormy
- [x] A plane cannot land when the weather is stormy
- [x] A random number generator is used to se the weather
- [x] Planes can only take off from airports they are in
- [x] Planes that are already flying cannot take off and/or be in an airport
- [x] Planes that are landed cannot land again and must be in an airport

### Project Structure
- [x] Separate files are created for every class, module and test suit
- [x] All tests passing
- [x] Test covererage > 95%
- [x] There is a useful README
- [] There is a feature test that lands and takes off a number of planes

## Getting Started
1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundler` (if you don't have bundler already)
3. When the installation completes, run `bundle`

```
git clone
cd airport-challenge
bundle install #installing dependencies
```

