
# ** Outline ** #
---

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

# User Stories #

---
## Step 1 ##
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

## Step 1 ##
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

## Step 2 ##
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

## Step 3 ##
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 

## Step 4 ##
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

## Step 5 ##
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
---

# Approach #

Each one of our user stories will first be treated as a single step. 
It will the be put through the 'TDD cycle tree' 
1. User stories will be broken down into features.
##### RED #####
2. Features will be broken down into failing feature tests.
3. Unit tests will be written that should provide the same errors in failing the test.
##### GREEN #####
4. The code to pass the test will then be written.
5. Where possible the code will subsequently be refactored with the aim to; simplify, clarify and make easier to maintain(reuse)
---
---

# User story 1
---
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
---
## Feature test 1
Air Traffic controller should take object plane and land it in container airport.
__Therefore__
'Plane' should repsond to method 'Land'
'Airport' should store 'Plane'
'Airtraffic_Controller' should apply the method 'Land' to the 'Plane
---


