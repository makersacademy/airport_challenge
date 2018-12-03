## Airport Challenge - Makers Academy Weekend Challenge
=====================================================

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

## Task
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

## Setup
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`

## Approach

Used the Test Driven Development (TDD) process learnt during week 1 at Makers Academy to develop a set of tests and corresponding classes to satisfy the above user stories. IRB was used to write feature tests, which were then implemented as unit tests using RSpec. Only once a failing unit test was correctly set up did I write code to satisfy that test. Once that test passed, I refactored the code before moving on to the next user story and repeated the TDD cycle.

We were required to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). I successfully test drove to this point.

I was unable to get past the third user story. In the tests, the use of doubles and a stub to override random weather to ensure consistent test behaviour was required. I didn't manage to successfully implement these, and felt that in the spirit of TDD I couldn't move on as I hadn't technically satisfied the red-green process.

## How I plan to finish the task:

1. Discuss my research and attempts to implement doubles/stubs with peers and coaches, as this was the block to progressing further with the task
2. After the above, TDD the 4th, 5th and 6th user stories
3. Ensure that code defends against [edge cases], such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.
4. Write an RSpec **feature** test that lands and takes off a number of planes
