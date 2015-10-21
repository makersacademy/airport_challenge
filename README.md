Airport Challenge
=================
We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

[![Build Status](https://travis-ci.org/dearshrewdwit/airport_challenge.svg?branch=master)](https://travis-ci.org/dearshrewdwit/airport_challenge)

Instructions
--------
1. Fork this repo, and clone to your local machine `git clone <url>`
2. Run the command `gem install bundle`
3. When the installation completes, run `bundle`
4. In the Gemfile, ensure ruby version is 2.2.3 in order to run RSpec tests (from project root directory)

Ensure you open `irb`, or `pry` from the project directory.
* Only Airports are allowed to instruct Planes to land or take off
* Remember to park newly created planes at your chosen airport before instructing them to take off
* There is a 20% chance bad weather will prevent landing and taking off

```ruby
$ irb # from project directory
> require './lib/airport'
> heathrow = Airport.new('LHR')
> jfk = Airport.new('JFK', 5)
> plane1 = Plane.new
> plane2 = Plane.new
> heathrow.move_to_hangar(plane1)
> heathrow.move_to_hangar(plane2)
> heathrow.take_off(plane1)
> heathrow.take_off(plane2)
> jfk.land(plane1)
> jfk.land(plane2)
```

User Stories
----
Here are the user stories that we worked out in collaboration with the client:
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
Approach
------
My approach to solving this challenge was to start with an Airport class, build it as much as I could until I needed to start understanding how one class object would change another. I did pretty well with a TDD approach until the last few problems arose where I didn't know how to write the tests to get what I wanted to happen. Because I didn't know how to even make the code work. It involved a lot of playing around in pry and tweaking until there was some semblance of satisying the user stories.

My approach could definitely be improved upon, but I found this challenge immensely interesting. The most difficult thing I found was keeping the tests in isolation with mocks and stubs because of the way I solved this challenge. I think there was definitely an easier way.


Weather
---------
* I found it conceptually simpler to have weather be simply a true/false airport attribute labelled 'stormy'.
* The User Story indicated this was acceptable by saying only prevent take_off and land when it is stormy.
* This also allows different airports to generate their own weather

Airport
=======
Land method
---------
* Airports couldn't land planes that were already at an airport.
* This meant a plane would have to have a location attribute which the airport checked before allowing it to land.
* Which meant that an airport needed to tell the plane where it had landed by having its own name attribute and changing the plane's location attribute upon a successful landing.

Take_off method
---------
* Airports couldn't tell planes to take off that were flying, not at the airport, or when it was stormy.
* For me that was 3 guard conditions and a way to modify the attribute of a plane upon a successful take off.


Planes
---------
* I didn't want the in_flight attribute to be writeable, just readable. In which case I couldn't set it from the Airport class, and I couldn't call a private plane method from the airport class, so I decided to have public methods to access from Airport, but with guard conditions to ensure a plane couldn't call a lands or a takes_off method on itself, only an airport could do so successfully.
* Interestingly a problem developed when instantiating a Plane because an Airport couldn't immediately give it a location. And thus an airport couldn't give land it and tell it to takes_off. So I used a workaround solution that involved an airport method to park a newly created plane in an airport. And then it could take off.
* As a result every plane has a location and a flight status attribute that is modified when an Airport tells it to land or take off. It can never be in more than one place.
