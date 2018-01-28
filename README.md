Marcus' README Edits - My approach and mini code review
=================

My approach
---------
* First thing I did was read all the user stories and map out a domain model of the different elements in the model and drew a simple diagram of the situation to contextualise it in my head
* I then made a list other elements to consider, such as the weather aspects and edge cases
* I broke down the problem into a list of features for me to drive using BDD
* Then I put these features in priority order, easiest first, for BDD
* As I went stage by stage completing each feature using BDD and RGR, I noted down nice to have elements that I would do if I had time at the very end
* After all core features were complete, I did some of the 'nice to have' elements e.g. splitting out methods into modules that I includes
* An important learning and application was using a solid Debugging process throughout (Digest error message, tighten the loop on where the problem was, fix the bug)


Mini personal code review: My appraisal of my attempt at the weekend challenge
---------

* I found writing the core code was quite an enjoyable process. I did not get stuck anywhere as I built up the core functionality through BDD, which took c.3 hours. I think this was due to the level of similarity with Boris bikes and due to applying my learnings from the week, particularly to very carefully read each and every error message (which meant I didn't write erroneous tests)
* Next steps if I had the time would be to simplify the test code (particularly the 'let' examples, which are long and take too much focus to keep track of) and spend more time ensuring the code was of good quality and refactored (e.g. fulling applying XP principles).
* There is also of course a lot of additional functionality that could be built, but I enjoyed applying the YAGNI principles in this case (You aren't gonna need it!)
* I was not sure if I should build direct tests of the boolean methods, which currently don't have tests as they are private methods
* I would like to review the quality of the design/structure of my code and tests, and verify with an experienced developer what I should focus on to better apply XP principles
* I made a first attempt at a feature test using a spec file, but don't know how to do this in practice, so keen to learn! 

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
