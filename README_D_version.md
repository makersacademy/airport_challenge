
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
__Therefore__
'Plane' should repsond to method 'Land'
'Airport' should store 'Plane'
'Airtraffic_Controller' should apply the method 'Land' to the 'Plane

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

---

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
---

# User story 2

---

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

---

Air Traffic controller should take object plane remove and remove airport. Check airport for plane.
__Therefore__
'Airport' should initialize with somewhere to remove a 'Plane' form
=> the simplest container to manipulate is an array which we will call 'hanger'
'Airport' contains array 'hanger'
'Airport hanger' can store a 'Plane'
'Airport' has method called 'take_off' to remove 'Plane' from 'hanger'
'Airport' has 'check' method which takes arguement 'Plane' to see if 'Plane' is still in 'hanger'

## Feature test 1
load './lib/airtraffic_controller.rb'
luton = Airport.new
luton.hanger
## Feature test 2
load './lib/airtraffic_controller.rb'
luton = Airport.new
slingsby_firefly = Plane.new
luton.take_off(slingsby_firefly)
p luton.hanger == []
## Feature test 3
load './lib/airtraffic_controller.rb'
luton = Airport.new
slingsby_firefly = Plane.new
luton.land(slingsby_firefly)
p luton.hanger == [slingsby_firefly]
## Feature test 4
load './lib/airtraffic_controller.rb'
luton = Airport.new
slingsby_firefly = Plane.new
luton.check(slingsby_firefly) == false
## Feature test 5
load './lib/airtraffic_controller.rb'
luton = Airport.new
slingsby_firefly = Plane.new
luton.land(slingsby_firefly)
luton.check(slingsby_firefly) == true

---

Test 1) load './lib/airtraffic_controller.rb' - (should load the ATC file) we then proceed to create a new Airport.
We expect this airport to contain a hanger for plane storage. It doesn't so we write our first test that should output the same error as our IRB test.
We run rspec to see it has the same error and then follow through by writing the passing code and going through Red, Green, Refactor.

Test 2) To be able to remove a plane from storage we should probably have one in out hanger in the first place. Our simplest approach is to manually initialize a hanger with one plane always in there to pass the test. We start by running a test to remove a plane from the hanger in irb using a method called 'take_off' the method is undefined so throws an error. Next step => write a failing test. First error: no defined method for 'take_off' so we go ahead and create the method in our Airport class and re-test. New error: given 1 arguement expected 0. Rewrite code to take a plane as an arguement. Next error => the plane isn't actually removed so we write the code which removes our arguement 'plane' from our 'hanger' and then return the hanger after.
This satisfies our test, so we can refactor.

Test 3) At this point we can remove a plane from our hanger and we can also land a plane, so I'm going to refactor my 'land' method so it can store the plane allowing me to run a more comprehensive 'take_off' test that will show me that our 'plane' instance is being removed from the 'hanger'.
This means that I can also write a clean method 'check' to see if a plane has been removed from our 'Airport'.
We start by testing to see if a plane instance is being stored in our array 'hanger' using IRB. It isn't so our test is failing the next step is to write a failing unit test. Our expectation is that when we create a specific instance of plane and use the method 'land' it will show up in 'hanger'. it doesn't which is the error we were looking for. Our next step is to make this test past. We write a code for the 'plane' to be shovelled into the 'hanger'.
It now passes and does what we expect it to do so we refactor and move on.

Test 4) __Part 1__
We now write a feature test: create an 'airport' which has a 'hanger', a 'plane' and ask the 'airport' to 'check' the 'hanger' for our 'plane'.
First error 'undefined method `check'... let's write our first failing test. We run Rspec and get the same failure so it's that most wonderful time of the year where we need to now overcome said error. We create a 'check' method and test again in IRB, it doesn't take arguements and so throws the error. We correct this by writing a new test that takes an arguement. it passes. We go back to test in IRB again, it throws a new error. The test should return true when we are checking if our 'plane' instance is in our 'hanger' instead it returns false. So we fix our test and method and subsequently re-test. It all passes and we refactor where needed.
__Part 2 of Test 4__
To be as thorough as possible we can also create a feature test and if nessecary a unit test to see that the 'check' also works when a 'plane' is in the 'hanger'... See Feature test 5 above. We go through the same procedures as Part 1 of Test 4.

End User Story 2

---
---

