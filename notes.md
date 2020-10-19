## Airport challenge ##

**classes**
 - aeroplane
    - can takeoff
    - can land
    - knows weather status
 - airport
    - can receive planes
    - can release planes
    - can count planes
 - weather
    - can be sunny
    - can be stormy

**content**
 - land
    - true  
        - weather isn't stormy
        - capacity isn't full
    - false
        - weather is stormy
        - capacity is full
 - takeoff
    - true
        - weather isn't stormy
    - false
        - weather is stormy
 - check for weather
    - after landing
    - before takeoff


**other**
- weather:
  - random number generator

- code
  - stub: override random weather to ensure consistent test behaviour
  - defend against [edge cases]
  - separate file for each class, module and test suite




*Unfinished - laid out the tests that needed but didnt get to add code to them , 
