Airport User Stories
=================

> As an air traffic controller, 
So I can get passengers to a destination, 
I want to instruct a plane to land at an airport

Notes: The air traffic controller, passengers and destination are all nouns. 
But it feels like only plane and airport need to be objects in the domain model.
Getting passengers to a destination is a bit like a verb or action. 
But here it feels like the message is “land at an airport”, being sent to the plane.

| Objects | Messages |
|---------|----------|
| Plane | land_at airport |
| Airport |  |


> As an air traffic controller, 
So I can get passengers on the way to their destination, 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

| Objects | Messages |
|---------|----------|
| Plane | take_off |
| Airport | plane_in_airport? |


> As an air traffic controller, 
To ensure safety,
I want to prevent landing when the airport is full

| Objects | Messages |
|---------|----------|
| Plane | do_not_land |
| Airport | airport_full? |


> As the system designer,
So that the software can be used for many different airports,
I would like a default airport capacity that can be overridden as appropriate

Notes: Don’t feel confident about this one. Is capacity a variable of the airport object? So is overriding that capacity a method? And how do you know if it is “appropriate”? Leave this one till later on!

| Objects | Messages |
|---------|----------|
| Plane |      |
| Airport | increase_capacity |


> As an air traffic controller,
To ensure safety, 
I want to prevent takeoff when weather is stormy

Notes: Again, not sure about this one (or 6 below).
Feels like weather is some other kind of condition. Is it an object? Doesn’t feel like a Class. Hmm. “if...weather == stormy, do_not_takeoff”

| Objects | Messages |
|---------|----------|
| Plane | do_not_takeoff     | 
| Airport |  |

> As an air traffic controller,
To ensure safety, 
I want to prevent landing when weather is stormy


| Objects | Messages |
|---------|----------|
| Plane | do_not_land |
| Airport |  |

**Combining Domain Models**
------


Look at the six user stories. Combine objects and messages.

| Objects | Messages |
|---------|----------|
| Plane | land_at_airport |
| Plane | take_off |
| Plane | do_not_land |
| Plane | do_not_takeoff|
| Airport | plane_in_airport? |
| Airport | airport_full? |
| Airport | increase_capacity |

This is helpful. Going to start with planning two classes: Plane and Airport. 
Which messages could / should become methods?

| Objects | Messages |
|---------|----------|
| Plane | land |
| Plane | do_not_land |
| Plane | take_off |
| Plane | do_not_takeoff|
| Airport | plane_in_airport? |
| Airport | airport_full? |
| Airport | change_airport_capacity |
