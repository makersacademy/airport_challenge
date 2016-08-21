Domain Model
---------

Objects | Messages     | Attributes
 --------|------------ | ---
 Planes  | plane? |   
 Airport | full?, in_airport?, land, take_off,| capacity, planes
 Weather | zeus (rand), stormy? |


- [ ] write my own README.md

Tests
------

airport_spec
- [x] is stormy when zeus decides (from shared example weather_spec)
- [x] is not stormy when zeus decides (from shared example weather_spec)
- [x] stops planes taking off when stormy (from shared example weather_spec)
- [x] has planes take off
- [x] does not accept planes when full
- [x] allows controller to override default capacity
  #land
- [x] can harbour planes
- [x] can check whether a plane is harboured
- [x] only lets a plane harbour once

plane_spec
- [x]  only allows plane objects to be passed into methods


- [ ] edge case: loads of planes are landed at once but storms happen per landing not per instance of airport. thus error when doing 20 landings is not related to capacity but to weather, incorrectly
