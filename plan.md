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
plane.land_plane

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
plane.take_off 

* Add goals this achieves in readme. *  
