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
## I documented my approach in 'kd_approach.md' <---- Please read me! :)
- I documented and explained the processes and approaches I used

**To improve my project, next time I would like to:**

- Implement tests for edge cases outlined
- Get test coverage metric from 99.28% to 100%
- Put my spec test files and structure them better into 'before 'do' and use 'contexts' to group 
test cases together for clarity
- Refactor some code to use predicate methods
- Consider removing duplicate functionality of 'stormy?' method on both the airport and 
weather objects and delegate that responsibility to the weather object and amend the test
case to account for this change


## Introduction to the project

This project is part of Week 1 of the Makers Academy software engineering programme. It focuses on test-driven development and object-oriented programming skills to satisfy the client's requirements presented in 'challenge_instructions.md'.

The aim of this project is to write software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy in which case no planes can land or take off.

## Motivation: What are my goals for this project?

#### For this challenge, I am specifically targeting the following Makers Academy goals:

**I can make anything**

- I can TDD anything
- I can debug anything
- I can model anything
- I have a methodical approach to solving problems

**I am equipped for long term growth**

- I can learn anything by myself

#### Relating to the above high-level goals, I would like to:

- Document and explain the processes and approaches I used

> This is presented in: 'kd_approach.md'.

Concrete things
- Apply the RSpec testing framework to test-drive the program

Concepts
- Understand how to test-drive objects & methods

Processes
- Use test-driven development to test-drive a simple program to control the flow of planes at an airport using objects and methods

Behaviours/mindset
- Take a step back to understand and break down requirements into user stories and test cases

## Tech/Framework Used

RSpec will be used as the testing framework.  

>"RSpec is a Behaviour-Driven Development tool for Ruby programmers. BDD is an approach
to software development that combines Test-Driven Development, Domain Driven Design,
and Acceptance Test-Driven Planning. RSpec helps you do the TDD part of that equation,
focusing on the documentation and design aspects of TDD." 

See documentation:
https://relishapp.com/rspec
http://rspec.info/

Ruby will be used as the programming language.

## Code Style

I will be checking my code conforms to the [Rubocop](https://github.com/bbatsov/rubocop) style guide.

## How to use the airport program

### 1. Getting Started

-  For the first iteration of the product, this software will be usable in Interactive Ruby via the terminal using `irb`.

-  Go to the terminal and type in `irb` from the root directory (main folder) to get started.

- Once in `irb`, type in the following to `require` the dependencies.

```
2.3.4 :001 > require './lib/airport.rb'
 => true 
2.3.4 :002 > require './lib/weather.rb'
 => true 
2.3.4 :003 > require './lib/plane.rb'
 => true 
2.3.4 :004 > 

```

All the files are now available! Next, you can follow the following steps to create your world!

### 2. Creating airports

- To create an airport, type in the following into your `irb`

```

2.3.4 :004 > heathrow = Airport.new
 => #<Airport:0x007faa2b00a668 @capacity=2, @plane_list=[], @weather=#<Weather:0x007faa2b00a640>> 
2.3.4 :005 > luton = Airport.new
 => #<Airport:0x007faa2b000938 @capacity=2, @plane_list=[], @weather=#<Weather:0x007faa2b0008e8>> 
2.3.4 :006 >

```

When a new airport is created, it has a default capacity of 2, a list of planes (which is empty by default) and some information about the weather at the airport location (taken care of by the weather object).

You can create as many airports as you like!

### 3. How to change the airport capacity

If you do not provide a capacity when creating the airport, it will give you a default capacity of 2. To provide a capacity at the time of airport creation, you can set the capacity by doing the following:

```
2.3.4 :006 > manchester = Airport.new(10)
 => #<Airport:0x007faa2a82e9d0 @capacity=10, @plane_list=[], @weather=#<Weather:0x007faa2a82e9a8>> 
2.3.4 :007 > 
```

In this example, you can see that manchester airport is given a capacity of 10 planes, which is set by the user at the time of airport creation. 

- You can also change the airport capacity at any time you like, if the airport does some expansion work.

```
2.3.4 :006 > manchester = Airport.new(10)
 => #<Airport:0x007faa2a82e9d0 @capacity=10, @plane_list=[], @weather=#<Weather:0x007faa2a82e9a8>> 
2.3.4 :007 > manchester.change_capacity(20) 
 => 20 
2.3.4 :008 > manchester
 => #<Airport:0x007faa2a82e9d0 @capacity=20, @plane_list=[], @weather=#<Weather:0x007faa2a82e9a8>> 
2.3.4 :009 > 
```

In the example above, I have changed the capacity of manchester because it had some expansion work done from 10 to 20 planes. :)

### 4. Creating a plane

- To create a plane, type in the following into your `irb`

```
2.3.4 :009 > british_airways = Plane.new  
 => #<Plane:0x007faa2a887508> 
2.3.4 :010 > air_france = Plane.new
 => #<Plane:0x007faa2a8777c0> 
2.3.4 :011 > 
```

### 5. Landing a plane

- To land a plane, type in the following into your `irb`

```
2.3.4 :011 > heathrow.land(air_france)
 => [#<Plane:0x007faa2a8777c0>] 
2.3.4 :012 > 

```

air_france has now landed at heathrow! You can see the plane at the airport by typing the airport name again.

```
2.3.4 :012 > heathrow
 => #<Airport:0x007faa2b00a668 @capacity=2, @plane_list=[#<Plane:0x007faa2a8777c0>], @weather=#<Weather:0x007faa2b00a640>> 
2.3.4 :013 > 

```


### 6. Take off a plane

- To take off a plane, type in the following into your `irb`

```
2.3.4 :014 > heathrow.take_off(air_france)
 => #<Plane:0x007faa2a887508> 
2.3.4 :015 > 
```

- Now the plane is no longer at the airport.

```
2.3.4 :018 > heathrow
 => #<Airport:0x007faa2b00a668 @capacity=2, @plane_list=[], @weather=#<Weather:0x007faa2b00a640>> 
2.3.4 :019 > 
```

### 7. Storms

- Sometimes, the message will appear to let you know that it is not safe to land a plane, or take off a plane because it is stormy! Safety first!

### 8. Reaching capacity

- Sometimes, the message will appear to let you know that the airport is full.

### 9. Airport has no planes

- If the airport is empty, you will need to land some planes, before take_off can be activated for use!


### 10 - EDGE CASES!!!

I'm unfinished with this, so will have to update with these edge case protection soon!

### I haven't implemented the edge cases, but here is the approach I would have used if I had more time.

##### TEST CASE(S) - EDGE CASES

1. Planes can only take off from airports they are in
  - Checks that plane is already in airport list and if it is in airport list, then take_off, raise an exception "Plane is not at airport" if plane is not in airport list

2. Planes that are already flying cannot take off and/or be in an airport
  - If plane is already out of airport list after take_off, then cannot take_off, raise an exception for this

3. Planes that are landed cannot land again and must be in an airport, etc.
  - If plane is already in airport list after landing, then cannot land, raise an exception for this

**Enhancements:**

- Ability for plane to land at specific airport?

## Images/Screenshots

## Getting started

`git clone https://github.com/kimdiep/airport_challenge.git`

## Running tests

Tests can be run from the root directory using:

`rspec`