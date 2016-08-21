Domain Model
---------

| Objects | Messages     | Attributes  |
| --------|:-------------:
| Planes  | land, takeoff |
| Airport | full?, in_airport | capacity, planes
| Weather | rand (zeus) |sunny, stormy


 planes that are already flying cannot takes off and/or be in an airport

2do

- [ ] refactor for single responsibility
- [ ] calm zeus down he is destroying tests randomly
- [ ] check all edge cases are covered
- [ ] make md files prettier


Tests 2 Write

- [x] an Airport "can harbour planes"
- [x] an Airport "has planes take off"
- [x] "planes cannot fly when stormy"
- [x] an Airport "does not accept planes when full"
- [x] an Airport "allows controller to override default capacity"
- [ ] an Airpot "only lets harboured plans take off"
- [x] an Airport "can check whether a plane is harboured"
- [x] an Airport "only lets a plane harbour once"
- [x] weather shared example "is stormy when zeus returns 4"
- [x] weather shared example "is sunny when zeus returns 1,2,3 or 5"
- [x] only plane objects can be passed as arguments

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

only plane objects can be passed as arguments
