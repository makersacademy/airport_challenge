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

Your code should defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

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

---------
#Sara Rancati - 19 October 2019
##My approach to solving the challenge:
---------

1) I started from the first user story, and tried to identify the 'objects' and the 'messages'.
2) I set up the workspace with the first spec file.
3) I wrote the first unit test: this is a simple test to verify that instances of the class Plane respond to the method '#land'. Test failed.
4) In my code file, I have created a class called 'Plane' and within this class I have defined a method called 'land' that accepts one argument.
5) Moving to the second user story. For this task I will need another method 'take_off' that will also accept one argument (airport). I will also need a method that confirms that the plane has left the airport (left_airport?) and a status associated with it (flying). Feature test.
6) I wrote a unit test for the above: after calling the method left_airport, I'd expect subject to be_flying. Test failed.
7) In my code, I created the method take_off(airport), and the method left_airport. Within left_airport I have set a variable 'flying' = true. I also added a method flying? that returns the variable 'flying'. Unit test passed. Feature test.
8) At this point I realised that the methods 'land' and 'take_off' would be more suited in a different class ('Airport') rather than 'Plane'. I created a new Airport class in a different file, and adjusted my unit tests accordingly.
9) The third user story introduces a different object (weather). I created a file for this new class and a spec file. I created a unit test for the Weather class - the weather_today method should return 'sunny'. Test failed. Added method that always returns the string 'sunny'. Test passed.
10) The value of the weather object could be either 'sunny' or 'stormy', so I implemented that in my code (an array with the two strings and a .sample method).
11) An error should be raised when takeoff is called and the weather is stormy. I wrote a rspec test for this. Test failed. I added the exception under the take_off method.
12) Given that the weather selection is random, I had to modify the test to predict what the weather would be (using a stub).
13) For the fourth user story, I repeated the previous step for the method land.


I refactored the code and checked indentation.
I can now commit and send a pull request.
