#Approach to first challenge

##1. Domain model

Class | Attributes| Methods
------------ | ------------- |------------
Plane| Landed (true : false), ID, airport_code |land_plane , take_off_plane 
Airport | weather (sunny, stormy), code, capacity|land_plane, take_off_plane
User | Type (Air traffic controller, System designer)| System designer - set_capacity

##2. Write feature tests from user stories 
  - _1 acceptance test for each user story_

##3. Follow BDD for each class identified in domain model
  - _writing rspec unit tests first_
      * build the simplest code to pass each test
      * refactor as go along
  
##4. Repeat for each class 

##5. Run relevant feature test
  - _once enough code is implemented_
         _amend unit test and class as appropriate_
 ##6. Feature Test cases:
  -__Scenario__
  
  __Landing__
  - Instruct a plane to land at an airport
  - Confirm that plane has landed at instructed airport
  - It becomes stormy as plane is coming in to land plane is prevented from landing
  - Airport is full so plane is prevented from landing
  
  __Take off__
  - instruct a plane to take off from an airport 
  - confirm that it is no longer in the airport
  - It becomes stormy as plane is preparing to take off plance is prevented from taking off


