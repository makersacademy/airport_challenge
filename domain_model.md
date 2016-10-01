## Airport Challenge Domain Model
---
---
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport and confirm that it has landed 

Objects | Messages
------------|------------
air traffic controller	| instruct_plane
plane	| land
airport	| recieve_plane

plane <-- instructed_to_land --> land_at_airport

airport <-- recieve_plane

---

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

Objects | Messages
------------|------------
air traffic controller	| instruct_plane
air traffic controller	| query_airport_about_a_plane
plane	| take_off
airport	| be_relieved_of_a_plane

plane <-- instructed_to_take_off

airport <-- be_relived_of_a_plane --> plane_not_available

---

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

Objects | Messages
------------|------------
air traffic controller	| query_weather 
weather	| 

weather --> report_conditions

airport <-- query_waether --> prevent_takeoff

---

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 

Objects | Messages
------------|------------
air traffic controller	| query_weather 
weather	|

weather --> report_conditions

airport <-- query_waether --> prevent_landing

---

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

Objects | Messages
------------|------------
air traffic controller	| query_airport_capacity 
airport	| prevent_landing_when_at_capacity

airport <-- at_cpacity --> prevent_landing

---

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

Objects | Messages
------------|------------
system designer	| set_airport_capacity
airport	| have_a_default_capacity

airport <-- new_airport_set_capacity

---
