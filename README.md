Airport Challenge
=================

This is my response to the 'weekend challenge' of Week 1 of Makers Academy. For full details of what the challenge involved, see 'APPENDIX' below.

Getting started
git clone path-to-your-repo
gem install bundle

Usage
Instructions are for Terminal on Mac OS

irb
require './lib.airport.rb'
require './lib.plane.rb'
Airport and Plane objects must be instantiated by using Airport.new and Plane.new.
Planes are airborne by default when instantiated.
The default capacity of airports is 50 which can be changed by supplying an optional argument to Airport.new.
Stormy weather prevents planes taking off and not landing.
There is a 14.3% (one in seven) probability of stormy weather at each take off and landing.

100% test coverage.

Plane class is empty - decided to keep it outside of other class files as I wished to keep the plane as a unique instance. I could have initiated it in the airport class but I felt that that would be crossing the SRP line, and if I wished to add characteristics or methods to planes then the scope to do so is inherent.


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
