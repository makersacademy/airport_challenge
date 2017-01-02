Airport Challenge
-----------------

Author: Courtney Osborn

        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)


Instructions
------------

An airport, planes and random weather must be created that allows the following:
- A plane must be able to land
- A plane must be able to take off
- A plane must be prevented from landing and taking off due to  stormy weather
- A plane must be prevented from landing due to airport being full to capacity

To Use Program
--------------
- $ git clone git@github.com:CourtneyLO/airport_challenge.git

Install Gems
------------
You require the following gems:

- gem 'rspec'
- gem 'capybara'
- gem 'rake'

To install the following gems, confirm that they are in the Gemile and then run:

-$ bundle install

Run Program
-----------

Use IRB or PRY:

- require './lib/airport.rb'
- Create an airport, plane and weather
- Make a plane to take off from the airport
- Make a plane land in the airport
- See the errors raised due to weather and max capacity at airport

Run Tests
---------

- $ rspec


Full Instructions: Task Set Out To Complete
-------------------------------------------

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. Here are the user stories that we worked out in collaboration with the client:

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
Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

Your code should defend against edge cases such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.
