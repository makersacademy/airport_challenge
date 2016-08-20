
weather = Random number generator
use stub to override weather to ensure consistent behaviour

Domain Model
---------

| Objects        | Messages     | Attributes    
| ------------- |:-------------:
| Planes     | land | takeoff |
| Airport | is_full? |         | capacity_default_overridable
| Aircraft Traffic Controller  | instruct_take_off_from_airport | confirm_not_in_airport | prevent planes when weather bad
| Weather |                   |sunny | stormy


Your code should defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

Tests 2 Write

- [x] an Airport "can harbour planes"
- [x] an Airport "has planes take off"
- [ ] "planes cannot fly when stormy"
- [x] an Airport "does not accept planes when full"
- [x] an Airport "allows controller to override default capacity"
- [ ] an Airpot "only lets harboured plans take off"
- [ ] an Airport "only lets a plane harbour once"

an Airport "can harbour planes"
1. Given: a plane and a airport
2. When: I tell the plane to land at the airport
3. When: I confirm it has landed
4. Then: I expect it to have landed

an Airport "has planes take off"
1. Given: a plane and a airport
2. When: I tell the plane to take off from the airport
3. When: I confirm it has taken off
4. Then: I expect it to have taken off
---
1. Given: it is stormy
2. When: I prevent an airport from activity
3. Then: I expect no landing or taking off from the airport
---
an Airport "does not accept planes when full"
1. Given: an airport is full
2. When: I try to land planes in the airport
3. Then: I expect to get a full error

an Airport "allows controller to override default capacity"
1. Given: an airport
2. When: I make a new airport with a non-default capactity
3. Then: I expect default airport capacity to be overriden

edge case tests
---
an Airpot "only lets harboured plans take off"

an Airport "only lets a plane harbour once"
