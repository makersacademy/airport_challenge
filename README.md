Airport Challenge
=================

[![Build Status](https://travis-ci.org/festinalent3/airport_challenge.svg?branch=master)](https://travis-ci.org/festinalent3/airport_challenge)


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

Author: Emma Sjöström

Task
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

My task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. I will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In my tests, I'll need to use a stub to override random weather to ensure consistent test behaviour.

My code should also defend against edge cases, such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc..

In code review Makers Academy are be hoping to see:

* All tests passing
* High Test coverage (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.


Approach
-----

I decided to first go ahead and implement two simple, 100% test driven classes; Plane and Airport. I knew I would want to go ahead and identify shared behaviors between them when I was done. So I did!

The next step was to imagine the things both planes and airports do - and I figured one key element is that they communicate with each other in order to enable landings and take offs.

A new spec file was created, aiming at testing the behavior of a "communicator" module. Gradually I could create a module, communicator, that handled exceptions that arised when a plane could not land or take off at an airport, and also control the actual landings and take offs, were they allowed.

I also created a weather_checker module allowing airports to update weather data.


Functionality
-----

Airports are always instantiated with sunny weather and no planes. Airplanes are preferably instantiated by passing the airport the plane belongs to as a parameter on initialization.  

It is not possible to 'set' a weather, since in real life that is unfortunately the case as well. There is a module called weather_checker included with a method that however makes it possible to get weather info, thus allowing us to wait until it is sunny again if we want to allow planes to land and take off. Just to get some variety, airports automatically update their weather status every time a plane is docked.

The result is that both a plane and an airport can go ahead and say "land plane" or "take off". A plane for example, can land itself and then the airport can tell it to take off. Or the other way around. Or the airport calls all the shots, or the plane. It doesen't matter since all communication and implementation of landings and take offs take place within the communicator module, indirectly setting all object attributes accordingly. Pretty neat!

I do however feel I have one weakness in my design: When initializing a plane, if not given a specific airport that it 'belongs to', it will simply go ahed and instantiate a new airport. Had I had more time, I would have looked deeper into resolving this issue. For now I feel like I have had a great opportunity to further practise TDD, SOLID principles and general Rspec functionality and logic.

I also included an Rspec feature test for the six user stories and a simple feature test for a few planes taking off from one airport and then landing at another airport.
