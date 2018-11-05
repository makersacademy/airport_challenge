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

Background
---------

Fist large individual project in the first week at Makers, which is helping to achieve the following development goals:

* I version-control my projects
* I test-drive my code
* I can work to a specification
* I can write standards-compliant, clean object-oriented code


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


Approach to solving the challenge
-----

In order to complete the challenge I followed TDD process by feature testing and writing unit tests before writing the actual code that makes the tests pass. At each stage I checked if the test coverage is high enough and if code conforms to the Rubocop style guide.
The software to control the flow of planes at an airport can fulfil user stories and allows air traffic controller to:

* instruct a plane to land at an airport,
* instruct a plane to take off from an airport and confirm that it is no longer in the airport,
* prevent takeoff when weather is stormy,
* prevent landing when weather is stormy,
* prevent landing when the airport is full,
as well as allow the system designer to override default airport capacity.
The code currently defends against some edge cases (planes that are already flying cannot takeoff and planes that landed cannot land again)

In the next steps I'm going to:

* refactor by separating weather information into its own class and file (to meet SRP)
* test further edge cases (planes can only take off from airport they are in, planes that landed must be at the airport). I'm thinking about using methods stubs `allow(obj).to receive(:method).and_return(:value)` to write the unit tests and later use `object_id` method to make the tests pass.

Instructions
-----
```
$ irb
2.5.0 :003 > airport = Airport.new
 => #<Airport:0x00007fb5c81a53d0 @planes=[], @capacity=20> 
2.5.0 :004 > plane = Plane.new
 => #<Plane:0x00007fb5c819d658 @location=:air> 
2.5.0 :005 > airport.land(plane)
 => :airport 
2.5.0 :006 > airport.take_off(plane)
 => :air 
 ```
 To change airport's capacity
 ```
$ irb
2.5.0 :003 > another_airport = Airport.new(50)
 ```


