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


######## Dionysis Kastellanis #######
October 01, 2016

- Forked the repo on my personal Github account
- Cloned it on my makers mac in "/Users/Dio22/Makers_Academy/Weekend_Challenges/Week1_airport_challenge"
- `gem install bundle` to install any required gems for the current challenge
- `bundle` to check if everything is installed properly. good to go now!
- running rspec results in 0 examples
- installing and initializing the makersinit gem

# FIRST USER STORY
- The user is an air traffic controller that wants to land a plane at the airport and get a confirm status that it has landed
-> an airport class is required to create an airport or many airports
-> a plane class is required to create planes
-> land method that will land a plane at the airport
- creating an airport_spec file to test for an instance of the class Airport
-> creating a lib folder
-> airport file to create the Airport class
- creating a plane_spec file to test for an instance
of the class Plane
-> plane file to create the Plane class
- test for the land method
-> in the airport spec file expect an airport to respond to the land method taking a plane as an argument
-> creating the land method in the airport file
-- requiring relevant file where is needed

# SECOND USER STORY
- allow a plane to take off from the airport and confirm status that is has departed
-> airport spec file to test for the method take_off with one argument
-> created take_off method in airport class

# FIFTH USER STORY
- prevent landing of plane when airport is full
-> compare number of planes in gates array (see third user story) with airport capacity and prevent a landing if airport is full

# SIXTH USER STORY
- airport capacity can be altered
-> while initializing an instance set the gate capacity size

# THIRD USER STORY
-> when landed planes are stored to the gates array
-> messages and raising errors for land method
-> messages and raising errors for take off method
->> By default a new airport will have stormy weather set to false
- plane should not take off if weather is stormy
-> stormy_weather method introduced in airport class that randomly will set the weather to stormy == true (3/10 times)
-> raise error if stormy_weather is true

# FOURTH USER STORY
- plane should not land if weather is stormy
-> raise error if stormy_weather is true
