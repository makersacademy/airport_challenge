Domain Model
---------

Objects | Messages     | Attributes
 --------|------------ | ---
 Planes  | land, take_off, plane? |   
 Airport | full?, in_airport | capacity, planes
 Weather | rand (zeus) |sunny, stormy


2do
-----

- [x] refactor for single responsibility
- [x] Plane class needs to exist not just mixin
- [x] calm zeus down he is destroying tests randomly
- [ ] check all edge cases are covered
- [x] make md files prettier


Tests 2 Write
------

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
- [ ] planes already flying cannot takes off and/or be in airport
