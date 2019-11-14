Airport Challenge
=================

My first weekend challenge was to create a simple application that allowed users to create airports and planes, advise those planes to land and take off all whilst accounting for a the weather. The user stories were as follows-

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

The application has 3 classes - a Plane class that allows you to land planes, a Airport class that allows you to takeoff and a Weather class that generates a random number between 1 and 10 every time it is instantiated. This then determines the weather and whether the plane is able to land or take off. 

The application is fully tested using Rspec and can be easily run from the terminal.

### Screenshots

<img src="images/plane_class.png?" width="400px">

A screenshot of the plane class - notice how the plane class holds the 'land' method

<img src="images/weather_class.png?" width="400px">

An weather class with an SRP - return a random weather variable

<img src="images/tests.png?" width="400px">

The test spec for the airport class

<img src="images/14_passing_tests.png?" width="400px">

14/14 passing tests

Technologies Used
-----

* Ruby
  * I built my application with Ruby - using the command line to allow users to build their own airports and planes
* Rspec
  * My testing framework was rspec - my final test suite had 14/14 passing tests

A Sample of the IRB
-----

```
2.6.0 :001 > require './lib/airport.rb'
2.6.0 :002 > require './lib/plane.rb'
2.6.0 :003 > require './lib/weather.rb'
2.6.0 :004 > gatwick = Airport.new
 => #<Airport:0x00007f9aaa079af8 @capacity=20, @plane_array=[]> 
2.6.0 :005 > virgin = Plane.new
 => #<Plane:0x00007f9aaa0aa568 @has_landed=false> 
2.6.0 :006 > easyjet.land(gatwick, Weather.new)
 => [#<Plane:0x00007f9aab845a10 @has_landed=true>] 
2.6.0 :007 > gatwick.takeoff(easyjet, Weather.new)
 => #<Plane:0x00007f9aab845a10 @has_landed=false> 
2.6.0 :025 > gatwick.takeoff(easyjet, Weather.new)
RuntimeError (Sorry - this plane is not at the airport)
2.6.0 :035 > easyjet.land(gatwick, Weather.new)
RuntimeError (Sorry - poor weather) # The application gives this error 1/10 times as per the Weather class
```


Installation
-----

* Git clone the project into your own local repository
* Run bundle install in order to download the relevant gems
* Run irb in your local repo in order to start the application
* Add the following into you IRB IRB

```
2.5.0 :001 > require './lib/takeaway.rb'
2.6.0 :002 > require './lib/plane.rb'
2.6.0 :003 > require './lib/weather.rb'

```

Tests
-----

After bundle install has been run you will be able to run rspec to test the application. Just run rspec in your terminal to do so.

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
