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

Overview
---------

This is my take on the "Airport Challenge", created by MAKERS.  
The target is the implementation of airports and planes which can land and take off,  
taking random weather into account.  
The implementation follows a TDD process and OOP princinples.  
The User Stories can be found below.  
A complete task description with all details is available in the CHALLENGE_DESCRIPTION.md.  

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

Installation
-----
Fork this repo and/or clone to your local machine.  
Run the command `gem install bundler` (if you don't have bundler already).  
When the installation completes, run `bundle`  

Getting started
-----
The repo consists of two classes:  
  
- Airport, which instructs the landing and take_off of planes  
- Plane, which can land/take-off

as well as one separate function:  
  
- weather, generating random weather that can potentially prevent landing/take-off.  

The best example of how to use these parts in conjunction,   
is the feature test in spec/feature_test_spec.rb  
  
Tests  
-----
To run the tests, navigate into the repo and run  
```
rspec
```