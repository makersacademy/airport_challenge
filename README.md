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

Task
-----
Week 1 challenge at Makers Academy: Create an airport with TDD and OOD in mind.
We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:
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
Domain Model
-----
| Object  | Messages     |
|:-------:|:------------:|
| plane   | flying?      |
|         | take_of      |
|         | land         |
| airport | full?        |
|         | set_capacity |
| weather | stormy?      | 

Approach
-----
I created three classes: 
- Plane: used to determine flying status of plane
- Aiport: used to model the airport functions including landing and taking off
- Weather: used to set the weather to be stormy with a given probability

Usage 
-----
Here is a an example of how the program works in irb
![Image usage in irb](https://github.com/Noora-q/airport_challenge/blob/master/irb_screenshot.png)

Status
-----
[![Build Status](https://travis-ci.org/makersacademy/airport_challenge.svg?branch=master)](https://travis-ci.org/makersacademy/airport_challenge)

[![Coverage Status](https://coveralls.io/repos/github/makersacademy/airport_challenge/badge.svg)](https://coveralls.io/github/makersacademy/airport_challenge)
