#Approach to first challenge

##1. Domain model

Class | Attributes| Methods
------------ | ------------- |------------
Plane| landed (true : false), ID, airport_code |land_plane , take_off_plane 
Airport | weather (sunny, stormy), code, capacity|land_plane, take_off_plane
User | type (Air traffic controller, System designer)| System designer - set_capacity

##2. Write feature tests from user stories 
  - Min_1 acceptance test for each user story_
  - _Feature Test cases:_
  -__Scenario__
  __As an airtraffic controller I want to...__
  __Landing__
  - Instruct a plane to land at an airport
  - Confirm that plane has landed at instructed airport
  - Prevent a plane from landing if it becomes stormy as plane is coming in 
  - Prevent a plane from landing if airport is full 
  
  __Take off__
  - Instruct a plane to take off from an airport 
  - Confirm that it is no longer in the airport
  - Prevent a plane from taking off if it becomes stormy as plane is coming in
  
  __Admin_System_designer__
  - Set the capacity of a particular airport

##3. Follow BDD for each class identified in domain model
  - _writing rspec unit tests first_
      * build the simplest code to pass each test
      * refactor as go along
      * plane cannot take off or land if stormy
      * plane cannot land if airport is full
      * plane cannot land is already landed
      * plane cannot take off if already in air
  
##4. Repeat for each class 

##5. Run relevant feature test
  - _once enough code is implemented_
         _amend unit test and class as appropriate_



