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
Getting started
---------------
1. Clone this repo to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`

Usage
------------------
```
$ irb

2.6.0 :001 > require './lib/airport.rb'
 => true

2.6.0 :002 > city_airport = Airport.new(20)
 => #<Airport:0x00007f86d68b7ae0 @capacity=20, @planes=[]>

2.6.0 :003 > plane = Plane.new
 => #<Plane:0x00007f86d68a7230 @inAir=true>

2.6.0 :004 > city_airport.land(plane)
RuntimeError (Cannot land due to stormy weather)

2.6.0 :005 > city_airport.take_off(plane)
RuntimeError (Plane not in airport)

2.6.0 :006 > heathrow = Airport.new
=> #<Airport:0x00007fa0730d11a8 @capacity=10, @planes=[]>

2.6.0 :007 > heathrow.land(plane)
=> #<Plane:0x00007f86d68a7230 @inAir=false>

```
My Approach
-----------
* **Airport** class handles landing and taking off of planes. It has a default capacity of 10 planes which can be overridden at initialisation. 
* **Plane** class handles flying status and associated edge cases.
* **Weather** class generates a random weather outlook: 1/3 of the time it is stormy and 2/3 sunny.

1. Implement user stories in Task section below using test driven development
2. Keep separate files for every class and test suite
3. Use simplest possible first test approach
4. Adhere to SRP and encapsulation principles (to the best of my ability)
5. Run Rubocop before every commit, tidying as I go
6. Once satisfied minimum user requirements, refactor to defend against edge cases

Task
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

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

Your code should defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.
