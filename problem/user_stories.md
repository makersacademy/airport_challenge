## User Stories & Object Model

#### Land

- As an air traffic controller 
- So I can get passengers to a destination 
- I want to instruct a plane to land at an airport

Object | Messages
-------------------------------- | ---------------------------------------
controller | 
passenger | 
airport | 
plane | land


#### Take-off

- As an air traffic controller 
- So I can get passengers on the way to their destination 
- I want to instruct a plane to take off from an airport
- nd confirm that it is no longer in the airport

Object | Messages
-------------------------------- | ---------------------------------------
controller | 
passenger | 
airport | 
plane | land
plane | take_off
plane | at_airport?


#### Prevent take-off

- As an air traffic controller 
- To ensure safety 
- I want to prevent takeoff when weather is stormy 

Object | Messages
-------------------------------- | ---------------------------------------
controller | 
passenger | 
airport | 
plane | land
plane | take_off
plane | at_airport?
plane | prevent_take_off
weather | is_stormy?


#### Prevent landing in stormy weather

- As an air traffic controller 
- To ensure safety 
- I want to prevent landing when weather is stormy 

Object | Messages
-------------------------------- | ---------------------------------------
controller | 
passenger | 
airport | 
plane | land
plane | take_off
plane | at_airport?
plane | prevent_take_off
plan | prevent_landing
weather | is_stormy?


#### Prevent landing when airport is full

- As an air traffic controller 
- To ensure safety 
- I want to prevent landing when the airport is full 

Object | Messages
-------------------------------- | ---------------------------------------
controller | 
passenger | 
airport | is_full?
plane | land
plane | take_off
plane | at_airport?
plane | prevent_take_off
plan | prevent_landing
weather | is_stormy?


#### Airport capacity

- As the system designer
- So that the software can be used for many different airports
- I would like a default airport capacity that can be overridden as appropriate

Object | Messages
-------------------------------- | ---------------------------------------
controller | 
passenger | 
airport | is_full?
airport | set_capacity
plane | land
plane | take_off
plane | at_airport?
plane | prevent_take_off
plan | prevent_landing
weather | is_stormy?