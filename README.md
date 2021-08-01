# Aifrport Challenge

The brief was to work through 6 user stories and implement TDD to build up the required classes, methods and code.


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


## Where I got to
I got up to step 4 whereby you needed to implement tests for changing the default capacity of the airport so that it can be varied. All tests pass with 100% coverage.


## Further work identified
Step 4 tests need to be implement as well as steps 5 and 6. I would likely approach steps 5 and 6 using a random number generator method and based on the results have stormy/sunny weather be returned based on a number. 
E.g sunny weather = 1 and stormy weather = 2. 


Alternatively you can do a range to increase/decrease the chance of a particular weather pattern being chosen by the random number generator method. 
Eg: sunny weather = (1..15) and stormy weather (15..20)



## Getting started

1. Run `git clone https://github.com/Battery0/airport_challenge.git`
2. Run the command `gem install bundler` (if you don't have bundler already)
3. When the installation completes, run `bundle`


## Running tests

Run `rspec` in the directory above /lib and /spec to run all the tests