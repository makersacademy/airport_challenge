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
---------

The [Airport Challenge](https://github.com/makersacademy/airport_challenge) is the first weekend challenge on the Makers Academy bootcamp. The task was to test-drive a program that controlled the flow of planes at an airport. 

These were the user stories:

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
I want to prevent landing when weather is stormy 
```

I created a set of classes and modules to satisfy the first three stories. For the fourth, I got as far as creating a default capacity, but not as far as one that could be overridden. 

For the fifth story, I would use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In the tests, I would use a stub to override random weather to ensure consistent test behaviour.

The code defends against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.