Airport Challenge
=================
My approach:

1. Domain Model - after looking at the first user story, I identified initially
two classes I needed to create (Plane and Airport)
2. User story 1: the class Plane gets a land function. It is true by default,
as there no indications it needs to take other values. The
Airport class gets a confirm_landing(plane) method. Initially, it only adds
the landed plane to an empty array of planes.
3. User Story 2: the Plane class gets a takeoff method that is true by default.
The Airport class gets a method confirm_takeoff, that pushes out of the array of
planes the plane that takes off.
Limitation: unless a plane was confirmed landing in an airport, it cannot leave.
4. User story 3: I make a new class Weather, which takes random values from 1 to
100. The class gets a method stormy?, that takes true if the random generated
number is less than 20 (so 1/5 chances of storm). Then, within the Airport class,
I create another predicate method - stormy_weather?, which basically initializes
a new instance of Weather and tells you if it is stormy. We use it in the
confirm_takeoff method. If it is true, the code fails with a message error.
5. User story 4 - within the confirm_landing method in the Airport class, I use
the same stormy_weather? method and if true, the code fails with an error message.
6. User story 5 - within the Airport class, I make a method airport_full, which
return true if the array of planes (number of confirmed landings) is higher than
the capacity of the airport. If true, within the confirm_landing method, the
code fails with an error message.
7. User story 6 - initially, the capacity is DEFAULT_CAPACITY, a constant set
within the Airport class. When we initialize the class, we set the capacity to
the default value. For being able to change it, we remove the default capacity
from the initialize method. Every time we instantiate a new airport, we add the
capacity argument.
8. I refactored using rubocop. I commented the Plane class methods and test, as
they do not have any role in the way the code works.
9. I tested all these features via irb and then rspec. I stubbed for the weather
but did not use any doubles.  

The tasks and requests bellow:


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
