Airport Challenge
=================

![learntofly](learntofly.png)

About
---------

This programme is based on the Makers Academy Weekend 1 challenge [(click here for original README.md)](ORIGINAL_README.md).

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. 

The task is to test drive the creation of a set of classes/modules to satisfy all the below user stories that we worked out in collaboration with the client:

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

In order the complete this task, I used the following techniques, processes and resources:
- TDD: using the RED - GREEN - REFACTOR style, and rspec
- A random number generator to set the weather in the production code, and a stub to override random weather to ensure consistent test behaviour in the test code (https://www.relishapp.com/rspec/rspec-mocks/docs).
- Consideration of edge cases such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; and planes that are landed cannot land again and must be in an airport.

In addition to meeting the user requirements, I also aimed for the following goals:
* All tests passing
* High test coverage (as close to 100% as possible)
* Elegant code: every class has a clear responsibility, methods are short etc. (with the help of Rubocop)
* The submission requirements as per the [CONTRIBUTING.md](CONTRIBUTING.md).

Installation steps
-------

1. Clone the repo to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. Run the programme in Ruby or via command line by requiring the airplane.rb in the lib directory
5. Tests can be run using Rspec
