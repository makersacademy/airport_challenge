Airport Challenge
=================

Instruction
---------

* The airport challenge is a software written in ruby and test driven by Rspec.  The tasks is to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. In the occasions that it may be stormy, no planes can land or take off.  

Approach
---------
* The design of the program is composed of three distinct classes to ensure single responsibility. See below diagram :

```
                Airplane <---- Airport ----> Weather
```

Airport class is the dominant controller that allows planes to land or taking off at an airport, initiated with default capacity and weather condition.  Airplane class feeds to airport class.  The weather class is extracted for randomised stormy weather condition at 30% chance.

Installation
-----
Please refer to gemfile for a list of gem dependencies and run 'bundle install' in terminal for gem installation.

Task
-----

Below are the user stories provided by the client:

```
As an air traffic controller
So planes can land safely at my airport
I would like to instruct a plane to land

As an air traffic controller
So planes can take off safely from my airport
I would like to instruct a plane to take off

As an air traffic controller
So that I can avoid collisions
I want to prevent airplanes landing when my airport if full

As an air traffic controller
So that I can avoid accidents
I want to prevent airplanes landing or taking off when the weather is stormy

As an air traffic controller
So that I can ensure safe take off procedures
I want planes only to take off from the airport they are at

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller
So the system is consistent and correctly reports plane status and location
I want to ensure a flying plane cannot take off and cannot be in an airport

As an air traffic controller
So the system is consistent and correctly reports plane status and location
I want to ensure a plane that is not flying cannot land and must be in an airport

As an air traffic controller
So the system is consistent and correctly reports plane status and location
I want to ensure a plane that has taken off from an airport is no longer in that airport
```

Comments
-------
Please feel free to leave any feedback or comments on bug fixing to the author : Amy Yang <ayc.yang@gmail.com>.
Thanks for checking out my repo!
