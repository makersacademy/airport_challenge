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

Objective
---------

The goal was to write a program which controls the flow of landing/take-off of planes at an airport provided it's sunny. Occasionally, it may be stormy, in which case no planes can land or take off.

Stack
-----

- Ruby
- RSpec
- Git/Guthub

User Stories
-------

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

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

Test Instructions
-----

```
git clone https://github.com/pgavenyte/airport_challenge.git
cd airport_challenge
rspec
```