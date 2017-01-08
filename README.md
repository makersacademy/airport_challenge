 BUILD STATUS: ![alt text] (https://travis-ci.org/olwend/airport_challenge.svg?branch=master)
#Approach to airport challenge 
##1. Assumptions 
The airport challenge is the first "weekend task" of makers boot camp. The learning objective is BDD and to test drive the creation of a set of classes/modules to satisfy all the above user stories, thus the design is a simplified air traffic control scenario. 

The airport is created by the system designer, when an airport e.g. EMA is onboarded. The capacity is set at creation.
The air traffic controller uses an account permissioned for a single airport e.g. EMA and this airport is used in methods.
These are set per user account and thus the rspec tests represent how the user story interacts with the application.
The first action of air traffic controller will be to land a plane, this is how the plane comes to exist in the application.

##2. Domain model

Class | Attributes| Methods
------------ | ------------- |------------
Plane| landed (true : false),(Enhancement: ID, airport_code) |land , take_off
Airport | weather (sunny, stormy), capacity,(Enhancement: code)|land_plane, takeoff_plane
Users | Air traffic controller, System designer| System designer - Sets airport capacity

##3. Write feature tests from user stories
  - Min_1 acceptance test for each user story_
  - _Feature Test cases:_
  -__Scenario__
  __As an airtraffic controller I want to...__
  
  __Control Landing__
  - [X] Instruct a plane to land at an airport
  - [X] Confirm that plane has landed at instructed airport
  - [] Prevent a plane from being instructed to land if it becomes stormy as plane is coming in
  - [] Prevent a plane from being instructed to land if airport is full

  __Control Take off__
  - [X] Instruct a plane to take off from an airport
  - [X] Confirm that it is no longer in the airport
  - []Prevent a plane from being instructed to take off if it becomes stormy as plane is coming in
  - []Prevent a plane from being instructed to take off if already in air
  
  __As an Admin_System_designer I want to...__
  - []Set the capacity of a particular airport

##4. Follow BDD for each user story building up classes identified in domain model
  -  This means writing rspec unit tests first
      * build the simplest code to pass each test
      * _refactor_ as work goes along
       
##5. Repeat for each user story, keeping tests and code in spec and ruby files specific to responsible class

##6. Run relevant feature test
  - _once enough code is implemented_
         _amend unit test and class as appropriate based on test output_
