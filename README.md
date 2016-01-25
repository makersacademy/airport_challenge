Airport Challenge
=================

Build Status
---------

[![Build Status](https://travis-ci.org/ggwc82/airport_challenge.svg?branch=master)](https://travis-ci.org/ggwc82/airport_challenge)

Approach
-------

I first broke down each user story into a domain model (see domain_model.txt) to allow me to make clear decisions regarding state and behaviour of each object:

```
Class: Airport
Methods/State: capacity, planes, full

Class: Plane
Methods/State: land, takeoff, airport

Class: Weather
Methods/State: condition
```

During the exercise I took to using pry to spike my feature test, and then proceed to Red, Green, Refactor with each user story. The earlier user stories modelled the behaviour of the plane objects with doubles and mocks used as substitutes for the airport and weather classes.

Airport class was then created and tested, with doubles and mocks removed from plane_spec.rb, and finally a weather class was modelled and integrated, to produce a fully working system. Further spiking in pry to attempt to test edge cases was performed, and a feature test also written.

TravisCI checks advise of 100% coverage of test case scenarios, and all houndci suggestions were acted upon and completed. 


Instructions
-----------

```
$ irb
2.2.3 :004 > airport = Airport.new
 => #<Airport:0x007faa43987728 @capacity=20, @planes=[]> 
2.2.3 :005 > plane = Plane.new
 => #<Plane:0x007faa4397ed08> 
2.2.3 :006 > weather1 = Weather.new
 => #<Weather:0x007faa430a3dc8 @condition="stormy"> 
2.2.3 :007 > weather2 = Weather.new
 => #<Weather:0x007faa4396e2f0 @condition="sunny"> 
2.2.3 :008 > plane.land(airport, weather2)
 => #<Plane:0x007faa4397ed08 @landed=true, @airport=#<Airport:0x007faa43987728 @capacity=20, @planes=[#<Plane:0x007faa4397ed08 ...>]>> 
2.2.3 :009 > plane.takeoff(airport, weather1)
RuntimeError: Can't take off - weather is stormy
```

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

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

Your code should defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.

