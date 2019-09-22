# Airport Challenge - Steps to Take

1. Update / Add to README
2. Turn user stories into functional representation - objects + messages and diagram of how these interact and the basic acceptance criteria to think about the most simple code
3. Feature test in irb
4. Read and fix error
5. Unit test with rspec (make sure I've required file; I've got a lib and my spec file)
6. Read and fix error
7. Pass the test
8. Move onto next step / user story

### User Story 1
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```
Objects      |   Messages
-------------------------
controller   |  instruct_plane
passengers   |  arrive_destination
destination  |  
plane        |  land_plane
airport      |

Airport <-- land_plane --> a Plane
airport.land_plane

I will need an *Airport* class and a *Plane* class.

### User Story 2
```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
Objects      |   Messages
-------------------------
controller   |  
passengers   |  to_destination
destination  |  
plane        |  
airport      |  take_off

Airport <-- take_off --> a Plane
airport.take_off

### User Story 3
```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```
raise_error when weather is stormy.
airport.take_off to fail if weather == stormy

### User Story 4
```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```
airport.land_plane(plane)

### User Story 5
```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```
Push plane into planes array.  
Start with capacity 1.
Adjust to capacity 100.

### User Story 6
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
Use constant variable. 

* Add goals this achieves in readme. *  
