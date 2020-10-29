Airport Challenge
=================



Description
---------

The first weekend challenge for Makers involved writing software to control the flow of planes at an airport. The planes should be able to land and take off in sunny conditions but not in stormy ones. There is also a maximum capacity of planes and when reached no more should be able to land at that airport.

User stories
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

How to run
-------

1. Clone this repo to your local machine
2. cd into the directory
3. Enter irb in your console
4. type require '.lib/airport'
5. Now you can create airports and planes to interact

Tests
-----

- The Rspec gem is used to create the tests
- rspec can be installed by running gem install rspec in your terminal
- cd into the airport challenge repo
- run rspec in the terminall to run the tests
