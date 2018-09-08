
#  __Outline__ #
---

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

# User Stories #

---
## Step 1 ##
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

## Step 2 ##
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

## Step 3 ##
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

## Step 4 ##
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 

## Step 5 ##
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

## Step 6 ##
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
##### REFACTOR #####
5. Where possible the code will subsequently be refactored with the aim to; simplify, clarify and make easier to maintain(reuse)

---
---

# User story 1

---

As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

---

Air Traffic controller should take object plane and tell it to land at airport.

## Feature test 1
load './lib/airtraffic_controller.rb'
## Feature test 2
load './lib/plane.rb'
## Feature test 3
load './airtraffic_controller.rb'
luton = Airport.new
## Feature test 4
load './plane.rb'
spitfire = Plane.new
## Feature test 5
load './airtraffic_controller.rb'
luton = Airport.new
spitfire = Plane.new

__Therefore__
'Plane' should repsond to method 'Land'
'Airport' should store 'Plane'
'Airtraffic_Controller' should apply the method 'Land' to the 'Plane

Test 1) load './lib/airtraffic_controller.rb' - (should load the Airtraffic controller file) Fails in IRB
=> so we create a spec file to test this too => test the file by running rspec - fails as there is no file to load.
=> create file to load: touch lib/airtraffic_controller.rb => go back to feature-test => Passes => rspec-test => passes.
We now have a spec file and a file for the Airtraffic Controller.

Test 2) load './lib/plane.rb' - (should load the file plane) Fails in IRB
Following the same procedures as above: Started by testing in IRB, we got a fail as theres no file for this so an spec file was created where we tested the existance if the required file.

Test 3) luton = Airport.new (should create a variable that stores and instance of an airport)
We run IRB first to test whether or not we can create a new instance of an Airport. This returns a fail as the constant is uninitialized.
Our new goal is to run a similar failing test using the spec file. This works leaving us the route of now passing the test. we create a constant known as Aiport and re run both tests. Both now pass and we create an instance of Airport in both.

Test 4) spitfire = Plane.new (should create an instance variable of a plane store under the name spitfire)
We run IRB first to test whether or not we can create a new instance of our Plane. It fail as the constant is uninitialized.
Our goal now is to run a similar failing test using the spec file and then passing the test. we create a constant known as Plane and re run both tests. Both now pass and we create an instance of Airport in both.

Test 5) subject.land(plane) (should take a plane and land it in an airport)
We run the file in IRB and try apply the .land method. It doesn't recognize the local method land().
A similar test is hence forth written in ATC(airtrafficcontroller)spec to achieve the same failure/test and subsequently we write the code to make it pass the test and remove the error 'Undefined local variable or method for 'land'. We re run all tests to see they pass and refactor if possible.

End User Story 1

---


