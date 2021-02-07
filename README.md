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

Description
---------

* A program for air traffic controllers, to instruct planes to land or take off at airports, to see status of planes, and to see which planes are at which airport.

How to use
-------

* To run in irb, require the 'script.rb' file from within the /lib directory.
* To create objects to represent planes and airports, use Plane.new and Airport.new.
* Call methods #land and #take_off on planes, with the Airport name passed as an argument, to land or take_off planes. Current airport default capacity is 10 - to change this, pass the capacity integer as an argument when creating an Airport object.
* Call .status on a plane to see if it is flying, or which airport it is currently landed at. New plane objects will have a status of "unassigned" until you call 'land' on them with an airport as an argument to assign them to an airport. This can be chained when creating the plane.
* Call .planes on an Airport to see which planes are currently stated there.
* There is a weather checker built into the take_off and land methods to prevent both from executing if the weather is stormy.
* If a plane attempts to land at a full airport, an error message will be raised.
* If a plane that is not flying is told to land, an error message will be raised.
* If a plane is told to leave an airport that it is not in, an error message will be raised.

Approach
-------

* I have not looked at the code review notes in order to make this more of a challenge.
* In contrast to the bikes challenge, I chose to define the land methods within the Plane class rather than the Airport class. This is largely I product of how I read the user stories, and I did contemplate switching them round. However, I felt it made a certain amount of syntactic sense to keep it how it was (and would also make the challenge slightly different, removing the temptation to simply copy and paste code from the challenge in the week.) I did find this created problems with testing the 'full?' method using doubles, as whatever the capacity of the double, its response to the full method would be hard-coded into it. This method is tested in the airport spec though so the coverage is still there.
* I have tried to design error messages so that they are thrown in a logical order (e.g. telling a plane to land when it is already landed throws an error before the question of the weather is even raised.)
* The biggest problem I had was with the weather method as I got caught up on making it reflect real life and making an airport always have a weather attribute. On reflection I felt that the point of the method was to simply get a snapshot of the weather at the exact moment a plane was instructed to land or take off, so I felt this wasn't necessary. I did feel it might make sense in real world application to store the most recent weather status to the Airport object each time it was checked, so that the controller could see this when telling planes where to land. However, building the weather method into the land and take_off methods effectively achieves the same thing, since the error message comes back before the plane is instructed to do anything. There was definitely a lesson in this in that I made it too complicated because of not test-driving it! I reverted a commit and made the method again through TDD and it was much more straightforward.
* Hopefully everything else is self-explanatory! I did initially also have a 'title' attribute for airports so they could be named, which would make the airport status more readable when planes were landed, but I felt this was making the code unnecessarily complicated, and that readability would be factored in when 'translating' this code into an actual user interface.

## Challenge Notes ##

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

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this at this moment.

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Note that is a practice 'tech test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.

* **Submit a pull request early.**

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.
