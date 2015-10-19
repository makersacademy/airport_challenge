Hello! This repository relates to the first weekend challenge I undertook at Makers Academy in October '15. Please see below for full details of what was required; in short, we had to model how an airport and planes would interact with each other in the presence of varying weather conditions.

I created two classes, (1) Plane and (2) Airport. Within the Airport class is a Weather module which an airport can call upon to determine weather conditions.

1. Plane

This class assumes that each instance of plane is in flight when initialized; hence, @flying instance variable is set to 'true' on initialization. This instance variable is modified when an Airport calls its "land" or "take_off" methods with the plane as an argument. Method "land" will set @flying to false, and method "take_off" will set @flying to true.


2. Airport

This class initializes with an empty "landed" array which represents the planes which are currently at the airport. This array has a default capacity of 10, meaning that the airport cannot hold more than 10 planes. There are two public methods within the Airport class, land and take_off, which require a plane as an argument. As expected, these methods allow a plane to land or take off.

The "land" method returns error messages if (i) the plane is currently flying, and / or (ii) the airport is full, and / or (iii) the weather is stormy. Upon landing, the @flying instance variable of the plane is set to false, and the plane is pushed to the landed array.

The "take off" method returns error messages if (i) the airport is empty, and / or (ii) the weather is stormy, and / or (iii) the plane is not located at that particular airport. Upon taking off, the @flying instance variable of the plane is set to true, and plane is deleted from the landed array.

---

This implementation of the problem does not adhere to the Single Responsibility Principle, as the take_off and land methods (1) change the @flying status of a plane and (2) modify the landed array associated with the airport. To change this, I should separate the concerns of these methods so that they stipulate whether a plane is clear to land / take off, i.e. determine whether the weather conditions are fine and whether there is room at the airport / whether the plane is currently at the airport. These methods should not require any plane as an argument.

Upon these conditions being satisfied, a plane should then be able to call land and take_off methods taking an airport as an argument. This method would change the @flying status of the plane, and call another (new) method on the airport to modify the airport's landed array as necessary. This method would, I believe, adhere to the SRP.

My implementation appears to be concise and satisfy all the tasks set out, but not necessarily adhering to "good code" principles. I'm a week into this course so will revisit when I know a bit more.

---

2.2.3 :001 > require './lib/airport'
 => true
2.2.3 :002 > airport = Airport.new
 => #<Airport:0x007f85ca0a8348 @landed=[]>
2.2.3 :003 > plane1 = Plane.new
 => #<Plane:0x007f85ca09b418 @flying=true>
2.2.3 :004 > airport.land(plane1)
 => [#<Plane:0x007f85ca09b418 @flying=false>]
2.2.3 :005 > plane2 = Plane.new
 => #<Plane:0x007f85ca081388 @flying=true>
2.2.3 :006 > airport.take_off(plane2)
RuntimeError: This plane isn't at the airport
	from /Users/ivansathianathan/Projects/airport_challenge/lib/airport.rb:26:in `take_off'
	from (irb):6
	from /Users/ivansathianathan/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :007 > airport.land(plane2)
 => [#<Plane:0x007f85ca09b418 @flying=false>, #<Plane:0x007f85ca081388 @flying=false>]
2.2.3 :008 > airport.take_off(plane1)
 => #<Plane:0x007f85ca09b418 @flying=true>
2.2.3 :009 > airport
 => #<Airport:0x007f85ca0a8348 @landed=[#<Plane:0x007f85ca081388 @flying=false>]>

 ---

Airport Challenge
=================

Instructions
---------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning
* If you do not submit a pull request, we will not be able to see your progress

Steps
-------

1. Fill out your learning plan self review for the week: https://github.com/makersacademy/learning_plan_october2015 (edit week 1 - you can edit directly on Github)
2. Fork this repo, and clone to your local machine
3. run the command `gem install bundle`
4. When the installation completes, run `bundle`
3. Complete the following task:

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

For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.

Please create separate files for every class, module and test suite.

The submission will be judged on the following criteria:

* Tests pass
* [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) is good
* The code is elegant: every class has a clear responsibility, methods are short etc.

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Note that is a practice 'tech test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.

* **Submit a pull request early.**  There are various checks that happen automatically when you send a pull request.  **You should pay attention to these - the results will be added to your pull request**.  Green is good.

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.
