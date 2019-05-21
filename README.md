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

This challenge was set as our first weekend challenge of the Makers Academy course. It enabled me to practice transforming user stories into usable code using test driven development, as well as improve my Ruby skills generally and become more comfortable with OOP and encapsulation.

Steps to run this program
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`

Using this program
-------

This is an example of how you could use this program in irb. You will need to `require` the `airport.rb` file first:
```
irb
require './lib/airport.rb'
airport = Airport.new
plane = Plane.new
airport.land(plane)
plane.landed?
airport.take_off(plane)
```

Approach
---------
For this challenge I will develop a program starting with the User Stories. From the information in the User Stories I can create the tests to be able to write the code. By working through each user story I was able to create objects and messages as the subjects and instructions for testing. I was able to work through the first 5 user stories and test for each but was unable to complete testing for the final user story.

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

What I learned from this challenge
-----
* Using stubs, doubles, context blocks and before blocks.
* Practiced TDD using Rspec testing framework.
* OOP and Encapsulation.


Author/Acknowledgements
-----
Dominic White
Makers Academy Challenge

