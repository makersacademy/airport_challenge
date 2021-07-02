
README.md

Approach: I applied the user stories as per the style in the boris bikes exercise and followed the general approach, making slight amendments in line with requirements. I identified plausible variables, conditions and modules then attempted some trials in Atom/Command Line as per the boris bikes challenge, using rspec to follow the TDD concept. I experienced issues using rspec. I therefore tried using another version of Ruby, checking the installation multiple times, checking paths and running simple tests. However, given the error messages were so varied after making changes and little progress was being made in the exercise over many hours I followed the example created as per this video guide to gain experience (which generally followed the same airport user story): https://www.youtube.com/watch?v=Vg0cFVLH_EM&t=5302s&ab_channel=SamMorgan

-Feature test then unit test was the main strategy.

Challenge with user stories:

# airport_challenge
[GitHub - makersacademy/airport_challenge: Fly!](https://github.com/makersacademy/airport_challenge)

  [README.md](https://github.com/makersacademy/airport_challenge#readme)
# Airport Challenge
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..——..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

# Instructions
* ::Feel free to use google, your notes, books, etc. but work on your own::
* If you refer to the solution of another coach or student, please put a link to that in your ::README::
* If you have a partial solution, ::*still check in a partial solution*::
* ::You must submit a pull request to this repo with your code by 9am Monday morning::

# Steps (done)
1. Fork this repo (done), and clone to your local machine (done) ([Before you continue to YouTube](https://www.youtube.com/watch?v=p_uOrMNXOSk))
2. Run the command ::gem install bundler:: (done) (if you don’t have bundler already)
3. When the installation completes, run ::bundle::(done)
4. Complete the following task:

Boris_bikes_reference: https://github.com/makersacademy/course/tree/master/boris_bikes

# Task
We have a request from a client to write the software to ::control the flow of planes at an airport::. The ::planes can land and take off provided that the weather is sunny::. Occasionally it may be ::stormy::, in which case ::no planes can land or take off::. Here are the ::user stories:: that we worked out in collaboration with the client:
__________________________

_“landing_one”_

1. As an ::air traffic controller::
So I can *get* ::passengers:: to a ::destination::
I want to ::instruct a plane:: to ::land at an airport::
*Objects*: air traffic controller, passengers, destination, *plane*
*Messages*: instruct a *plane* to land at an airport

air traffic controller <— instruct a *plane* to land at an airport (destination) —> true/false (boolean) +=1

_“landing_two”_

2. As an ::air traffic controller::
So I can *get* ::passengers:: on the way to their ::destination::
I want to ::instruct a plane:: to ::take off from an airport and confirm:: that it is no longer in the airport
*Objects*: air traffic controller, passengers, destination, *plane*
*Messages*: instruct a *plane* to take off from an airport and confirm that the *plane* is no longer in the airport

air traffic controller <— instruct a *plane* to take off from an airport and confirm that the *plane* is no longer in the airport —>true/false +=1

_“no_landing”_

3. As an ::air traffic controller::
To ::ensure safety::
I want to ::prevent landing when the airport is full::
*Objects*: air traffic controller, *plane*
*Messages*: prevent *plane* landing when the airport is full

air traffic controller <— Is the airport full? —> land?

_“override”_

4. As the *system designer*
So that ::the software can be used for many different airports::
I would like ::a default airport capacity that can be overridden as appropriate::
*Objects*: system designer
*Messages*: a *default airport capacity* (150 planes?) that can be *overridden* as appropriate

default airport capacity —>override

_“no_takeoff_storm”_

5. As an ::air traffic controller::
To ::ensure safety::
I want to ::prevent takeoff when weather is stormy::  (Test doubles below - random number generator to set the weather)
*Objects*: air traffic controller
*Messages*: prevent takeoff when weather is stormy

air traffic controller <— weather is stormy —> prevent takeoff

_“no_landing_storm”_

6. As an ::air traffic controller::
To ::ensure safety::
I want to ::prevent landing when weather is stormy::
*Objects*air traffic controller
*Messages* prevent landing when weather is stormy

air traffic controller <— weather is stormy —> prevent landing
__________________________

Your task is to ::test drive:: the ::creation of a set of classes/modules to satisfy all the above user stories::.

You will need to ::use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy).::

In your tests, ::you’ll need to use a stub to override random weather to ensure consistent test behaviour::.

Your code should ::defend against  [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b)  such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.::

For ::overriding random weather behaviour, please read the documentation to learn how to use test doubles:::  [https://www.relishapp.com/rspec/rspec-mocks/docs](https://www.relishapp.com/rspec/rspec-mocks/docs)  . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.
Please create separate ::files for every class::, ::module:: and ::test suite::.

In code review we’ll be hoping to see:
* ::All tests passing::
* High  [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md)  (>95% is good)
* ::The code is elegant::: ::every class has a clear responsibility, methods are short etc.::
Reviewers will potentially be using this  [code review rubric](https://github.com/makersacademy/airport_challenge/blob/master/docs/review.md) . ::Referring to this rubric in advance will make the challenge somewhat easier.:: You should be the judge of how much challenge you want this at this moment.

* Note that is a ::practice ‘tech test’ of the kinds that employers use to screen developer applicants.:: More detailed submission requirements/guidelines are in  [CONTRIBUTING.md](https://github.com/makersacademy/airport_challenge/blob/master/CONTRIBUTING.md)
* ::Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.::

* *::Submit a pull request early::.* ([Before you continue to YouTube](https://www.youtube.com/watch?v=rgbCcBNZcdQ)), ([Before you continue to YouTube](https://www.youtube.com/watch?v=a_FLqX3vGR4))

* Finally, please submit a ::pull request:: before Monday at 9am with your solution or partial solution. However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.

*BONUS*

* ::Write an RSpec *feature* test that lands and takes off a number of planes::
