# Airport Challenge

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

Description
===========

Request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

User Stories
============
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

Approach and Technologies
=========================
* Code written in Ruby.

* Unit testing using RSpec.

The project uses three main classes:

**Airport** responsible for taking off and landing planes. This includes preventing take off or landing when there is bad weather or if the airport is at full capacity.

**Plane** responsible for new instances of planes. There are two properties ```taken_off``` and ```landed``` that report whether the plane has taken off or landed.

**Weather** responsible for generating weather conditions for airport. The weather is only stormy 10% of the time.  Set using Ruby's rand class. Main challenge was to stub the behaviour of weather object to always be good during tests.

Instructions and Installation
=============================

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`


Further Features
==============

* Write an RSpec feature test that lands and takes off a number of planes
