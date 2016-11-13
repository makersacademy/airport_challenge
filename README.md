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

A program to control the flow of planes at an airport. Planes can land and take off if the weather is sunny. If the weather is stormy, no planes can land or take off.

# Airport.rb

  Contains main body of the program. A new instance of the Airport class is initialized with a random weather condition (stormy or sunny), and a default capacity of 5 planes.

  Users can check the status of a plane by calling the #status(plane) method:
      e.g. airport.status plane1 #=> Landed / In the air

  Planes can be landed and taken off with the #landed(plane) and #take_off(plane) methods.

  #report_weather returns "It is sunny." or "It is stormy." depending on weather conditions.

  #check_new_weather sets the weather randomly to sunny or stormy and reports the new weather.

  Private methods:
   # remove_from_airport used to remove taken off planes from the airport's @planes array.
   # bad_weather_landing? & bad_weather_taking_off? stop a plane from taking off or landing during a storm.
   # full? stops a plane from landing if the aiport is at maximum capacity.

# Plane.rb

 Contains the Plane class, by default initialized as "in the air", unless the user initializes it with the argument (true).

 #land method is called by the Airplane class, but switches a plane's 'landed' status to true if it is false.

 #take_off switches a plane's 'landed' status to false.

# Weather.rb

 Contains the Weather class, initialized with a random weather condition (stormy or not).

 Weather is weighted towards sunny (not stormy) with a private method that generates a random number between 0 and 3. If the random number is 0, weather will be set to stormy.

 # Tests

 Testing was one of the main challenges with this program - particularly the random weather generator. Airport_spec.rb contains many attempts to use stubs to set a specific weather condition, but I could not get these to work in time. Because of this, I had to use an attr_accessor to set weather in each test, which very much violates the DRY principle.


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
