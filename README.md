<!-- 
I have completed the challenge with 99% coverage however have been unable to go through the 'rudocop' to fix the violations in my code. 

Missing Rudocop element:: I mismanaged my time over the weekend and focused on the Boris Bike task on saturday in turn not leaving enough time to address this challenge fully. This has been a learning curb for me. 

I would have also liked to put the stormy? method in a Weather file.

———

Firstly I broke down the Users stories into Requirement/ Domain Model. 

———

As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport


Airport = instruct plan to land i.e. add the airport instance to be added to a the plane instance - stores plane
Plane class = landing method that assigns an airport 

———

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

Airport class = instruct to take off // remove from log
Plane class = take off method removes airport assignment 

——

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

Airport class - have max capacity / error when trying to land 

——

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

——

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

—

such as inconsistent states of the system ensuring that 

planes can only take off from airports they are in; 
planes that are already flying cannot take off and/or be in an airport; 
planes that are landed cannot land again and must be in an airport, etc.

———

After breaking down, my approach for the challenge was to address each user story one by one focusing on the specific object. I.E Story 1 - Aiport class > Story 2 > Airport class. 

——— -->



#  Airport Challenge


## Motivation

Main motivations for this project is:
- Commit commit commit that git
- Learn to TDD 
- Write code with consideration to OOPrinciples 
- Learn to Stub and Mock tests in RSPEC 

## Code style
Ruby-standard-style

## Tech/framework used
Built with: 

Ruby 
RSPEC 

## Code Example
Show what the library does as concisely as possible, developers should be able to figure out how your project solves their problem by looking at the code example. Make sure the API you are showing off is obvious, and that your code is short and concise.

## Tests

99% test coverage

<!-- Describe and show how to run the tests with code examples.

How to use?
If people like your project they’ll want to learn how they can use it. To do so include step by step guide to use your project.

Contribute
Let people know how they can contribute into your project. A contributing guideline will be a big plus.

Credits
Give proper credits. This could be a link to any repo which inspired you to build this project, any blogposts or links to people who contrbuted in this project. -->

## Plan 

### User Story 

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

### Domain Model 

|Objects|	Messages|
|-------|-----------|
