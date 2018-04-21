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


### The User Stories ###
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
### How To Install ###
* Fork and clone the repo to your local repository
* Install gems
``
bundle install
``
### How To Use Program ###
This program allows you to create Airports, Planes and random Weather. The program will allow you to land and take off Planes from airports. It will also raise errors if a airport is full, the weather is stormy or you are trying to land a grounded plane or take off a airborne plane. All new planes must check the weather report before landing or taking off incase of bad weather. The Default capacity of the airports are 4 if you would like to change this add a argument on creation of instance
``
airport_name = Airport.new(NUMBER)
``

### Running The Program ###
Start the program in IRB and require the lib files
```
irb
2.5.0 :001 > require './lib/plane.rb'
 => true
2.5.0 :002 > require './lib/airport.rb'
 => true
2.5.0 :003 > require './lib/weather.rb'
 => true
 ```
 The weather is stormy around 30% of the time to change the likeliness, amend the ``stormy_decision_maker`` method in the weather.rb file.

 ### Running Tests ###

 `rspec`
