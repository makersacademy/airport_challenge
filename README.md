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

In response to user stories (included [below](#user-stories) for reference) this program simulates planes landing and taking off from airports. The code covers simple edge cases and also incorpates a random weather generator to prevent planes landing/taking off. 

The code comes with unit and feature tests - all currently passing.


Development Process
------------------

The program was developed test-first:
1. Initially `irb` was used to create feature tests: how I wanted my program to work in response to a user. These commands are detailed below.

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

* **Submit a pull request early.**  There are various checks that happen automatically when you send a pull request.  **Fix these issues if you can**.  Green is good.

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.
