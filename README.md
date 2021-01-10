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

Intro
---------
This is my submission for the first weekend challenge of the Makers Academy course. The idea was to build a ruby programme that simulates some of the functionality you might want from airport control software, as described in [Task](#task) below.

My Approach
--------
- Built in ruby, spec written using rspec, and using rubocop for style checking.
- I tried to use a TDD approach when coding this challenge.
- I started off by converting the user stories given into a [domain model](docs/domain_model.md) with an Object & Messages table.  
- Then, starting with the first user story, I built features one at a time, ensuring all tests still passed.
- I tried to ensure I was committing regularly - pretty much after every test was passed.
- I then would often refactor to follow the SRP as much as possible, meaning there are lots of short methods, but hopefully the result is easy to follow.  

New Learnings
---------
- I found rubocop useful as it led me to some concepts I hadn't known about before - safe navigation using `&.` for example.  
- This was the first time I had used method stubs in rspec, and I was expecting to find them harder to use than I did!

Issues Encountered
--------
- This was the first work I've done on the Makers course where we had to go from user stories to product without steps in between. It took a fair bit of staring at the specs to work out where to begin.
- Having built an initial draft of the land and take off methods (and the Airport and Plane classes) I realised I wasn't testing for enough edge cases, so I added more tests in and it took me a while to get them all to pass.  
- I did a bit of to-ing and fro-ing about whether the Weather should be a separate class or just be a method in the Airport class (since the weather makes more sense for a particular location) but decided eventually that there should be a Weather class. Each airport instance then has an instance variable associated with it that itself is an instance of the Weather class.  
- Weighting the likelihood of stormy versus sunny weather seemed like something that should have been easier than it was. I feel like the approach I took won't scale very well, but in this case it seems to be fine. Testing the outcome was non-trivial too, as a simple test that there was more sunny than stormy weather wasn't rigorous enough - it would pass about 50% of the time if given equal likelihoods of each outcome.


Instructions
---------

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
--------

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
