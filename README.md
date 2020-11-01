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
My solution to the Week 1 Weekend Challenge at Makers Academy, a TDD & OOP assignment to create a fully tested way to control plane and airport objects through Ruby.
## My solution
I broke the below problem down into two classes, Airport and Plane, supported by a Weather module.
 
 I then wrote tests, using Doubles to simulate interaction between classes during unit testing. I then wrote a comprehensive integration test to ensure that these interactions were consistent when using the actual classes.
 
I tested for reasonable edge cases, and used TDD development (notably the red-green-refactor method) to write my code throughout, as well as feature testing regularly in IRB.

SimpleCov shows that I reached 100% test coverage for the project, with all tests passing.

## Example Usage
```console
git clone https://github.com/ehwus/airport_challenge.git
cd ./airport_challenge
bundle install
bundle
irb -r "./lib/plane.rb"
2.6.5 :001 > require './lib/airport.rb'
 => true
2.6.5 :002 > plane = Plane.new(true)
 => #<Plane:0x00007fc02c23b308 @call_sign="TDW1", @airbourne=false> 
2.6.5 :003 > airport = Airport.new
 => #<Airport:0x00007fc02c242338 @capacity=50, @planes=[], @weather=#<Weather:0x00007fc02c2422c0>> 
2.6.5 :004 > plane.land(airport)
```


Assignment Brief
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