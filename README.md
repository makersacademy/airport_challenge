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

This program emulates the taking off and landing of plates at an airport, it also tests for whether it is safe to take off or land depending on the weather conditions.

This challenge enabled me to implement my debugging and TDD skills while using Rspec tests. 

I approached this challennge in the following way:

1. Wrote out the Rspec test that showed what I was aiming for as per the user stories.
2. Ran Rspec and used the error messages to write out the source-code.
3. Repeated this process until I had a fully functional passing test.

How to use:
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. All done!

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

Rspec Test
-----
All the 12 tests passed with 100% coverage and 0 Rubocop offences.

