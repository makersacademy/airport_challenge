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

To build a simulation of an airport system to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  


User Stories
-----
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

Solution
-----
My design solution has 3 classes:
* Airport
* Plane
* Weather

The Airport class initializes with a default capacity of 20 planes and starts off empty. This capacity can be altered by specifying the required capacity when the airport is created. When the airport reaches capacity, it will not allow any more planes to land until a plane has taken off.

Airports have two public methods:
* takeoff - this method takes a plane as an argument and will take off that plane, provided that the weather conditions aren't stormy and the plane is at that particular airport.
* land - this method takes a plane as an argument and will land that plane, provided that the weather conditions aren't stormy and the plane is flying.

In addition to the public methods, Airport has 5 private methods:
* full? - checks the number of planes being held at the airport
* stormy? - checks the weather condition
* at_airport? - this takes an argument of a plane and checks whether that plane is being held at the airport
* add_plane - this takes an argument of a plane and adds that plane to the airport planes array
* remove_plane - this takes an argument of a plane and adds removes that plane from the airport planes array


The Plane class initializes all planes to be flying when created.

Planes have three public methods:
* takeoff - raises an error if the plane is already flying. It will change the flying status to true if the plane is landed.
* land - takes airport as an argument. It raises an error if the plane is already landed, if not, it sets the flying status to false and the airport attribute to the current airport it is in.
* airport - if the plane is landed, this will give the airport it is currently at. If the plane is flying, this will return an error.

In addition to the public methods, Planes have one private method:
* landed - this checks that a plane is not flying.

The weather class is initialized when an airport is created. It generates a random condition between sunny and stormy whenever airports land or takeoff are called. This is setup on a 3:1 ratio.


Usage
-----
Open the terminal, navigate to the root directory of the application. Enter `irb` in the terminal then the application is available to use.

```
$irb
2.5.0 :001 > require './lib/airport.rb'
 => true
2.5.0 :002 > airport = Airport.new
 => #<Airport:0x00007fdd611b2970 @weather=#<Weather:0x00007fdd611b2948>, @capacity=20, @planes=[]>
2.5.0 :003 > plane = Plane.new
 => #<Plane:0x00007fdd611a3268 @flying=true>
2.5.0 :004 > airport.land(plane)
 => [#<Plane:0x00007fdd611a3268 @flying=false, @airport=#<Airport:0x00007fdd611b2970 @weather=#<Weather:0x00007fdd611b2948>, @capacity=20, @planes=[...]>>]
2.5.0 :005 > airport.takeoff(plane)
Traceback (most recent call last):
        3: from /Users/andrewkemp/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):5
        1: from /Users/andrewkemp/Library/Mobile Documents/com~apple~CloudDocs/Makers Projects/week1/airport_challenge/lib/airport.rb:21:in `takeoff'
RuntimeError (Unable to take off in stormy weather)
```


Testing
-----
The application was fully test driven using the rspec framework. To run the tests, navigate to the root directory of the application in the terminal, then enter `rspec` to run the tests.
