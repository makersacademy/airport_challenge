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

Instructions
------------

The Airport challenge was the first weekend challenge at Makers Academy.

The challenge was to create software to control the flow of planes at an airport. The airport would allow plays to land and to take off and would have a certain plane capacity. We also had to create random weather conditions that would be mostly sunny and also stormy on the rare occasion.

Objectives
----------

- To consolidate our understanding of Object Orientated Programming
- Improve our skills using Test Driven Development


Technologies
------------
- Ruby
- RSpec

Completed User stories
----------------------
>
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
>
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
>
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
>
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

Attempted User stories
----------------------
>
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
>
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

Created weather spec with 2 tests for the above user stories.
However I ran out of time incorporating it into airport.

To Run
------
git@github.com:jameshughes7/airport_challenge.git

To Run tests
------------
rspec
