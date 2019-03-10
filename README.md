Airport Challenge

[Getting started](#getting-started) | [Usage](#Usage) |
[Running tests](#running-tests) | [Brief](#Brief) | [Approach](#Approach) |
[Code Status](#Code-Status)

This weekend challenge is for submission to Makers Academy. The code creates a
programme which allows the user to control outgoing and incoming aircraft,
dependent on airport capacity and flying conditions.

### Getting Started
1. Clone to your local machine using
  git@github.com:LaurenQurashi/airport_challenge.git
2. Run `gem install bundle`
3. Run `bundle`

### To use
run irb in the terminal and require 'airport.rb'. To test this code, use rspec
or rubocop.

### Task
-----
We have a request from a client to write the software to control the flow of
planes at an airport. The planes can land and take off provided that the weather
is sunny. Occasionally it may be stormy, in which case no planes can land or
take off.  Here are the user stories that we worked out in collaboration with
the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is
no longer in the airport

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

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

------

### Approach

To combat this challenge, I used the standard practice of TDD. This involved
writing a very simple failing test, checking the error code, and doing the least
I could to pass my simple test. Repetition of this process allowed me to evolve
my programme into the current product.

To start this process, I reduced the user stories down, one by one, to nouns
and verbs, and considered how these nouns would interact with each other. Once
completed, I would formulate my classes and objects from this list of nouns and
verbs. An example of this would be to have a class called Airport which had
multiple methods in such as fly_plane and land_plane to suit the users needs.

The next step would be to create the most simple test I could using rspec, to
ensure that this method wasn't possible, and thus work on a solution to resolve
this. By repeating this step, I soon built up the code to complete the
requirements for the first user story.

### Code Status

Currently, the code satisfies the user stories, however remains incomplete due
to an inability to finish the **BONUS** requirement. To solve this, I would
investigate into adapting the land_plane and fly_plane methods under the Airport
class. I would assume that these methods would need to take an integer argument,
which would instruct the method to repeat as specified by the argument. To
implement this, I would consider using the .times method on my argument
placeholder.

The test coverage statistic reports at 98.59%. All tests pass the rspec.
