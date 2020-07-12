# Approach to Solving the Airport Challenge

## My Approach

1. Create a functional representational diagram using the information in the User Stories (see below)

2. Decide upon Classes and what the responsbilities of the Class should be, limiting their responsbilities as much as possible (*SRP*)

3. Create a rough idea of what the Class methods need to do and what preconditions will need to be met for them to be enacted, with a focus on edge cases: 

4. Follow TDD principles learnt in Week 1 (*RED, GREEN, REFACTOR & the 3 A's*) to build the Classes, starting with the simplest Class first

5. Continue to build until all specifications are met while maintaining 100 Coverage throughout

6. Draft my APPROACH-README.md

7. Attempt Bonus feature test (multiple planes landing and taking off)

8. Update APPROACH-README.md accordingly

9. Run RuboCop and remove highlighted deficiencies

10. Submit pull request (as early as possible)
 ---

### Functional Representational Diagram

| Object | Message |
| ----------- | ----------- |
| Weather* | stormy? |
| Plane | landed, taken_off, flying? |
| Airport | capacity, weather*, plane, full?, checks_for(plane), land(plane), take_off(plane),  |

*Initially I had the weather component within the Airport class:
```
class Airport
...
WEATHER_CONDITIONS = ["sunny", stormy"]

def initialize(...)
  @weather = WEATHER_CONDITIONS.sample
  ...
end
```

I then realised I could utilise a seperate Weather class (result in higher cohesion) and thus went about wholescale changes after this [commit](https://github.com/rjkviegas/airport_challenge/commit/e12294e5fc70e3ee4f070fa80114380217f5d5c8) 




### User Stories ### 
```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

