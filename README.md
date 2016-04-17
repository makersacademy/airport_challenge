Airport Challenge
=================

**Author:** Omar Alvarez

[![Build Status](https://travis-ci.org/omajul85/airport_challenge.svg?branch=master)](https://travis-ci.org/omajul85/airport_challenge)

Task
-----

I have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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

The task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. I need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In my tests, the probability of bad weather is 20%.

The code should defend against edge cases, such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

RSpec
-----

For testing the airport class, I did not use double since when an airport is initialized, by default it contains 2 planes. So, I used one of those planes for testing: `let(:plane) { subject.planes.first }`.

For testing the plane class I used an airport double:

```
let(:airport) { double(:airport, :name => "CDG", :ready_for_landing? => \
  true, :ready_for_taking_off? => true, :planes => [subject]) }
```
For testing the exceptions on my RSpec file, I simply call the functions that should raise the error. Since the errors are handled using `rescue`, the function prints the error message that is raised. I did not find a better way to test the exceptions in RSpec, but at least, in the RSpec results you can see that the error was raised and rescued as expected.

