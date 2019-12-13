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
Stories completed:

1)
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
Process: Developed the following tests for this user story:
  1> that an instance of Airport class is created
  2> that a method called land exists
  3> a test which actually tests this functionality, so that the landed plane's information
     is stored in the programme (created a variable called 'landed planes' for this purpose.)

2)
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
Process: Developed the following tests for this user story:
  1> that a method called take_off exists
  2> a test which checks that the plane which had taken-off is no longer stored where information
     about landed planes is included.

3)
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
Process: Developed a test which checks whether the programme raises an error when the specified
capacity in landed_planes is exceeded. Getting this test to pass required some refactoring, as
I needed to set the maximum capacity of the airport, and adding the method raising an error when
a plane is trying to land but capacity is at maximum. It also required refactoring the initialize
method to provide a default capacity.

4)
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
Process: Developed a test which creates an airport object with a capacity of 30 (while standard
maximum capacity is 20). After this I needed to refactor the code as a few of the tests now broke
as the initialize method wasn't able to receive an argument.

Currently working on 5)
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
Process: adding a new test which checks the weather, and using a mock to make it return 'stormy'
for the purposes of running this test. Then expecting an error when trying to take off. This broke
some of the earlier tests so needed to fix those by adding stubs/mocks. I was able to fix them but
cannot figure out why this test does not pass and now I am running out of time!

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
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
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
