[![Build Status](https://travis-ci.org/samover/airport_challenge.svg?branch=master)](https://travis-ci.org/samover/airport_challenge)  Airport Challenge
=================
* [The task](#task)
* [My Approach](#my-approach)
* [Usage instructions](#usage-instructions)

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

Please create separate files for every class, module and test suite.

The submission will be judged on the following criteria:

* Tests pass
* [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) is good
* The code is elegant: every class has a clear responsibility, methods are short etc.

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Note that is a practice 'tech test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.

My approach
--------
The files in this repo are the result of my second attempt at solving the set task. The first attempt was not bad, but I felt it could be more elegant and simple.

My approach has been methodic. I took every user story, made a domain model, wrote feature tests and made them fail. Then I wrote unit tests and made them fail. Only then would I start writing code, taking care to write only the minimal code in order to pass my tests. The resulting file structure is as follows:
```
lib/
    - airport.rb
    - plane.rb
spec/
  feature/
      - airport_features_spec.rb
      - plane_features_spec.rb
      - traff_contr_features_spec.rb
      - bonus_spec.rb
  - airport_spec.rb
  - plane_spec.rb
```

I made two changes in comparison with my first attempt:
  1. I pulled the weather conditions method in a separate class, following SOLID guidelines
  2. I started developing the Plane class first, as my understanding of the first two user stories evolved

The latter change had as a result that the unit tests became much clearer to define and ultimately to read. Delegating the right methods to the right class simplified the coding process as well.

One thing I am not sure off, and might well change in a later update, is that every plane also has a location variable set either to `:air` or an instance of Airport. I asked myself: how can I test whether a plane is in an airport or not? Given that there are possibly many airports, it seemed better to add a location tag to the plane rather than check every airport for the registered plane. However, it is implied that when a plane has landed, it is actually in an airport and it doesn't matter for the running of the program that the instance of plane knows where it is.

The last step was to write the `bonus_spec`, in order to test the landing and taking off of a number of planes. A simple enumeration (i.e. `planes.each { |plane| airport.clear_for_landing plane }`) does not land all the planes, since averse weather conditions sometimes raise error. These had to be encapsulated in a `begin/rescue` clause and the landing had to go on until **all** planes had landed.

Usage Instructions
------------------
```
2.2.3 :003 > airport = Airport.new
 => #<Airport:0x007fee7412a9c0 @capacity=20, @planes=[]>
2.2.3 :004 > plane = Plane.new
 => #<Plane:0x007fee7395af10 @location=:air, @status=:flying>
2.2.3 :005 > airport.clear_for_landing(plane)
 => :landed
2.2.3 :006 > another_plane = Plane.new
 => #<Plane:0x007fee73930210 @location=:air, @status=:flying>
2.2.3 :007 > airport.clear_for_landing(another_plane)
 => :landed
2.2.3 :008 > airport.planes
 => [#<Plane:0x007fee7395af10 @location=#<Airport:0x007fee7412a9c0 @capacity=20, @planes=[...]>, @status=:landed>, #<Plane:0x007fee73930210 @location=#<Airport:0x007fee7412a9c0 @capacity=20, @planes=[...]>, @status=:landed>]
2.2.3 :009 > airport.capacity
 => 20
2.2.3 :010 > airport.clear_for_takeoff(plane)
 => :flying
2.2.3 :011 > airport.planes
 => [#<Plane:0x007fee73930210 @location=#<Airport:0x007fee7412a9c0 @capacity=20, @planes=[...]>, @status=:landed>]
2.2.3 :012 > airport.clear_for_takeoff(another_plane)
RuntimeError: Weather is stormy
	from .../airport_challenge/lib/airport.rb:25:in `clear_for_takeoff'
	from (irb):12
	from .../.rvm/rubies/ruby-2.2.3/bin/irb:11:in `<main>'
2.2.3 :017 > airport.clear_for_takeoff(another_plane)
 => :flying
 ```
