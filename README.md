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

Motivation --
-----

To build a simple yet functioning Airport program that allows planes to take off and land, based off the weather conditions & plane capacity. This was my first Makers weekend project to complete.

User Specification --
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

Process -
-----
I first worked out the objects and messages required for the challenge, taking these from the user story and building them into feature tests to run before starting to write code. This included working out what instance variables would be required and what sort of attributes I would be storing in the program.

This was followed by a BDD driven process by utilising RSpec to write the tests and work through the AAA methodology by arranging, acting and asserting the test example groups to build a working program from red, green to eventually re-factored. 

Challenges - 
-----
Some of the challenges included learning RSpec syntax and getting an understanding of which methods were available to use. 
Implementing the allow method to test for stormy weather for expected outcome with rand int.

Refactoring methods caused some older tests to fail. This required re-writing to get them into a pass state. 

Had to change the landed method as the expected behaviour didn't match what was actually happening. This happened due to no feature testing. 

Edge cases considered -
-----
* Planes cannot take off if they are already flying
* Planes cannot land if they are already grounded

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage] (98.99%)
* The code is elegant: every class has a clear responsibility, methods are short etc. 
* Code meets Rubocop guidelines

What I've learnt - 
-----
* Continue to improve understanding of RSpec and it's syntax
* Don't skip feature tests
* Stick to the BDD principles to maintain best practice
* When continually hitting an error, break it down and debug 

How to run - 
-----
Program created in Ruby. Can be ran directly from terminal, or inside IRB. (Follow install steps - https://github.com/ruby/irb)