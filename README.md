Airport Challenge - Orla Dunlop
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

Introduction
---------
This challenge was completed at the end of **Week 3** of the Makers Apprenticeship course over the course of a day. The purpose of the challenge was to test my what I had learnt over the week about **Test Driven Development** and effective debugging.

My Approach
-------
* I began with the first user story - using the online tool Miro to identify what actions needed to be taken (i.e. what objects, what actions).
* I identified that the first thing my code needed was an aiport - I ran a feature test to see if this felt like the natural first step for this user story and once I confimed that I created my first unit in "airport_spec.rb" which described a class called Aiport.
* This first run of my unit test failed as no class called Airport existed - so I created a new file airport.rb and set up a new class Airport with no methods. Then my unit test passed.
* This was the process I continued to take: writing unit tests and allowing this to guide me and let my code develop organically.
* Each time I passed a test I ran rubocop.
* Each time I felt my code delivered what the user story asked for (by running a feature test to make sure I could do everything the user story asked for) - I commited my code.
* I would then return to Miro to begin on the next user story and repeat the above.

User Stories
-----

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

