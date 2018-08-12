Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____DL____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

What does it do?
--------------

In response to user stories (included [below](#user-stories) for reference) this program simulates planes landing and taking off from airports. The code covers simple edge cases and also incorpates a random weather generator that prevent planes landing/taking off during stormy weather. 

The code comes with unit and feature [tests](#running-tests] - all currently passing.


Development Process
------------------

**OOP & (TDD using RSpec)**

The user stories were broken down into objects and methods:

| Objects       | Messages         |
| ------------- | -------------    |
| airport       | land plane       |
|               | take off plane   |
|               | check edge cases |
|               |                  |
| plane         | landing          |
|               | taking off       |
|               | check edge cases |
|               |                  |
| weather       | stormy?          |


The objects and messages defined my Classes and Methods, and how I intended my User to interact with the program.

The program was developed test-first:
- Initially `irb` was used to create feature tests (i.e.how I wanted my program to work in response to user input). These commands are detailed in section [Usage](#usage). These feature tests have now been incorporated into RSpec so they can be run automatically. Take a look at the features tests [here](specs/feature_tests.rb).
- Unit tests were also created in RSpec. These shape how I intend specific blocks of code to work in isolation. 
- 

Usage
-----


Running Tests
------------


User Stories
-----------

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
