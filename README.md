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
Before we begin
---------------

An early step for me was to edit this README and do a git push to verify my Git/Github is working as expected, since I've had fatal Git issues recently. Please note the following : 
- I copied the original README locally to Makers_README.md and put that in gitignore as I don't want that added to the Github repo.
- I have kept all the original content of this file below, after the heading "Original README Content"

Now on to the good stuff

Method of working
-----------------
- I analysed the user stories and wrote the object/message table for each.
- I drew a diagram to show the relationship between objects and the messages they take i.e their interface methods.
- In irb I performed the feature test for the behaviour that I was currently testing e.g. when a plane takes off, verify that it has actually gone from the airport.  
- I then created the simplest test for the interface method. Using rspec: 
  * I saw my test fail (RED)
   * I wrote the code in order to make it pass
   * Then I saw it pass. (GREEN)
   * Then I REFACTORED it.
- I updated this README when a unit test was passed and staged all the files in Git (git add .) and did a git commit with a descriptive message.
- I ran rubocop to check adherence to coding style and format before every commit and sometimes while doing rspec.
- At certain times I did a git push to see all the changes in Github. This was useful to make sure my Git/Github was working fine and also it was a good to see the README updated in my Github homepage.
- I tried to follow a 15min period for the read & refine cycle in the context of the TDD process but I found it difficult to do this and will hope to improve with practise.

User Stories
------------------------
User story 1
------------
Initially my thinking was for there to be a Plane class which would have an interface method #land. But after following Domain model web resources which were being shared by the cohort, and comparing to the Boris Bikes project, it became clear to me that the Airport was the controlling class and it had an #instruct_land interface method that would take a Plane object as an argument. I stuck to the terms used in the user stories, hence:

| Object       | Message       |
|---------------|----------------| 
| Airport | instruct_land |

Airport --> instruct_land --> Plane

Unit tests are : airport responds to #instruct_land / to #instruct_land(with_1_argument)

User story 2
------------
| Object       | Message       |
|---------------|----------------| 
| Airport | instruct_takeoff |
| Airport | confirm_gone |


Airport --> instruct_takeoff --> Plane

Airport --> confirm_gone --> Plane

Unit tests are : airport responds to #instruct_takeoff / to #instruct_takeoff(with_1_argument) / to #confirm_gone / to #confirm_gone(with_1_argument) / #confirm_gone results in plane gone from airport

Original README Content
=======================

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
