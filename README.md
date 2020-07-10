[![Build Status](https://travis-ci.org/cmb84scd/airport_challenge.svg?branch=master)](https://travis-ci.org/cmb84scd/airport_challenge)

## This is my airport challenge!
This is Makers Academy's week 1 weekend challenge.

### How to use
To use clone this repo and then do the following:
```
run 'bundle install'
open 'irb'
require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'
weather = Weather.new
airport = Airport.new(weather)
```

### User Stories and requirements
These are <a href="#userstories">here</a>

### How it went
For the most part I was happy with this but I had one issue that took me a while to solve. It wasn't raising an error when stormy as expected. I initially wasn't sure why and every so often would go back to it to see if I could work it out. I eventually did and it was when I did repeated rspec tests that I discovered the problem. It was raising an error but not all of the time and this is due to the weather being a random behaviour. So I stubbed the weather behaviour in all the necessary parts of my tests (more than I expected!) and yay, all the tests pass all of the time!

I'm very happy that I kept trying to solve it as I've learnt a lot from doing it.

##### Edit: 13/6/2020
I went back to this challenge today as I was unhappy with some of the tests. In a few instances I was testing state rather than behaviour. I went through my tests, deleting as necessary, added some and improved others. I am now much happier with this and I also added Travis!

##### Edit: 10/7/2020
In working on another project I realised when doing dependency injection, I don't need to require the other file. For example I was originally requiring both the plane and weather files at the top of the airport file. I have now removed these and everything works fine. Just remember to require all files when in IRB and create the weather instance first so that you can inject it into your airport instance!

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
<a name="userstories"></a>
Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```
```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```
```
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
