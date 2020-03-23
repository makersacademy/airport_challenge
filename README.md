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

Week 1 Makers Academy weekend project. 


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

* **Submit a pull request early.**

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.



## Status and remaining steps

For this challenge, I completed user story 4. The steps I was working on at the end of this task was to ensure planes only took off from airports they were in and landed into airports they weren't and were flying when not in either. 

Having been able to confirm whether a plane is at the airport, my next steps would be:
- :land raise_error when trying to land if already at the airport (@hanger = [plane])
- :take_off raise_error when plane not in the airport (@hanger = [])
- :flying? within Plane class. Still to establish how to do this. 


## Reflections
---

Whilst being unable to complete this task, my understanding of TDD has increased significantly. After user story 1, and some peaking at [Harry's](https://github.com/hturnbull93/airport_challenge) initial steps to see if I was on the right track, it became clear to me I needed to step back and take some time to read more about TDD and Rspec as my understanding of these was not enough to continue, I was going no where!

My break down of the user story into the steps needed to ensure this was testing correctly and my code was building to meet its requirements, was not enough and the steps in my plan were too big (I was not thinking about it in terms of testing). Going forward my plan for each user story became far more substantial, and this make a big difference in building the tests and ultimately allowed me to complete 4 of the user stories. 

Rspec syntax, which matcher to and how the tests allow us to build and test the code, whilst still a long was from having 'got it' I feel I have a much better understanding on from doing this task. 

