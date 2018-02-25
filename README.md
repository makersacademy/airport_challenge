Review
=================
How did I approach the challenge?
---------
* 1.) Read the user stories.
* 2.) Identified the key objects and methods within them.
* 3.) Created the unit tests for the simpler objects.
* 4.) Wrote the code for the simpler objects (i.e weather and airport).
* 5.) Did the same for the more complex objects (i.e air_traffic_controller and plane).
* 6.) Initial refactor to adjust program so that more control was given to the objects.
* 7.) Secondary refactor.


Elements attempted
---------
* Basic features.

Narrative
---------
 Key objects are created using the below syntax.

`2.5.0 :001 > controller = AirTrafficController.new
 => #<AirTrafficController:0x00007fee049a71b8>
2.5.0 :002 > gatwick = Airport.new
 => #<Airport:0x00007fee04992b00 @capacity=10, @hangar=[]>
 2.5.0 :003 > weather = Weather.new
 => #<Weather:0x00007f9b0c8b3c48 @current=:sunny>`

 In order to create a `Plane` object you need to pass it an instance of an airport.
 This airport is considered the planes starting airport.

 `2.5.0 :004 > plane = Plane.new(gatwick)
 => #<Plane:0x00007f9b0a8378e8 @airport=#<Airport:0x00007f9b0b80aa90 @capacity=10, @hangar=[]>, @flight_approval=false>`

 If a `Plane` attempts to take off without flight approval an error will be raised.

 `2.5.0 :005 > plane.take_off`
 `RuntimeError (no flight approval)`

 If a `Plane` attempts to land when it is already landed an error will be raised.

 `2.5.0 :006 > plane.land(gatwick)`
 `RuntimeError (you are already landed)`

 If `Air traffic controllers` know the plane and the weather, so weather-willing they can do so.

 `2.5.0 :007 > controller.flight_approval(plane, Weather.new.current)
  RuntimeError (denied - weather is not sunny)`

 Not this time...

 `2.5.0 :008 > controller.flight_approval(plane, Weather.new.current)
  => true`

 Approval has been granted! The plane can now take off.

 `2.5.0 :009 > plane.take_off`

 `Air traffic controllers` can check on the status of planes at all times.

 `2.5.0 :010 > controller.request_status(plane)
  => :inflight`

  For a plane to land it must specify where it is landing through an argument. If it doesn't also have approval an error will be raised.

 `2.5.0 :011 > heathrow = Airport.new
  2.5.0 :012 > plane.land(heathrow)
  RuntimeError (not approved to land here)`

  So long as the weather is not stormy, `Air traffic controllers` can grant approval to land at specific airports.

  `2.5.0 :013 > controller.land_approval(plane, Weather.new.current, heathrow)`

  Although approval has been given, plane is still inflight.

  `2.5.0 :014 > controller.request_status(plane)
 => :inflight`

  Plane is then able to land at that airport.

  `2.5.0 :015 > plane.land(heathrow)`


















































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

Instructions
---------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Steps
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. Complete the following task:

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

Your code should defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.

Please create separate files for every class, module and test suite.

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Note that is a practice 'tech test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.

* **Submit a pull request early.**  There are various checks that happen automatically when you send a pull request.  **Fix these issues if you can**.  Green is good.

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.
