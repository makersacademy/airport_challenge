## Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------``
                =  ===(_________)
```

# Introduction

The following programme is a solution to the 'Airport Challenge', that controls the flow of airplanes at an airport.
Airplanes can both land and take off, provided that the weather conditions are safe to do so. If it is stormy, which is controlled by random number generator, a plane can neither land or take off from an airport

 The programme should satisfy several pre specified user stories, which are detailed below:

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

In addition to these user stories, the programme had to satisfy a number of edge cases that defended against inconsistent states and ensured that:
* planes can only take off from airports they are in;
* planes that are already flying cannot takes off and/or be in an airport;
* planes that are landed cannot land again and must be in an airport, etc.

# Method

In order to solve this challenge, I followed the tenets of Test Driven Development (TDD) and the Behaviour-Driven Development (BDD) cycle.

This resulted in first creating a domain model for each user story, then writing feature tests for that story, followed by its constituent unit tests, and then practicing the red-green-refactor method.

Note: All unit tests are contained within the 'spec' folder.
These can be ran with the gem Rspec.  

# How to run this programme
Initial steps:
1. The software has been written in the language Ruby. Therefore, to successfully run this programme, Ruby must first be installed.
2. Fork and clone this project onto your machine.
3. Change into the directory that the project is saved in.
4. Launch a REPL (Read Evaluate Print Loop), such as IRB, to allow you to run the programme.

Running it...
Once your selected REPL is open, an extremely important first step is to require the airport.rb file. Once this is done you can then interact with the programme.

The code below demonstrates how to create both an Airport and an Airplane instance. The Airplane is then landed at the Airport.
That same Airplane is then instructed to take off but the following error is raised "Plane cannot take off due to stormy weather". Note, stormy weather is generated randomly, with a less than 25% probability of occurring.

```
2.2.3 :001 > require './lib/airport'
 => true
2.2.3 :002 > Heathrow = Airport.new
 => #<Airport:0x007fd535029b50 @landed_planes=[], @capacity=50>
2.2.3 :003 > Boeing = Airplane.new
 => #<Airplane:0x007fd53501a880 @in_flight=true>
2.2.3 :004 > Heathrow.land_plane(Boeing)
 => [#<Airplane:0x007fd53501a880 @in_flight=false, @airport=#<Airport:0x007fd535029b50 @landed_planes=[...], @capacity=50>>]
2.2.3 :005 > Heathrow.take_off(Boeing)
RuntimeError: Plane cannot take off due to stormy weather
```
