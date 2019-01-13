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

Summary
-------

The airport challenge is a test to simulate an air traffic control system as the
first weekend project at Makers.

Tech used
---------

Development was in Ruby using RSpec in a strict TDD process based on the user
stories below.

Installation Steps
-------------------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`

Test coverage/code format
-------------------------

100% test coverage, no rubocop offenses detected

Code walkthrough
----------------

Object Airport

  public
  - new(hanger_capacity): initialises a new airport with a specified hanger
                          capacity (defaults to 100 if none specified)
  - land(landing_plane): lands the specified plane at airport if possible
  - take_off(taking off plane): cause the specified plane to take off if possible
  - in_hanger?(plane): returns true if a specified plane is in the airport hanger
  
  private
  - airport_full?: return true if the airport hanger is airport

Object Plane

Module Weather
  -  stormy_weather?: returns true if it is stormy (10% chance)

User Stories
------------

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
