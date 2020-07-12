# Approach to Solving the Airport Challenge

## My Approach

1. [x] Create a functional representational diagram using the information in the User Stories (see below)

2. [x] Decide upon Classes and what the responsbilities of the Class should be, limiting their responsbilities as much as possible (using **SRP**)

3. [x] Create a rough idea of what the Class methods need to do and what preconditions will need to be met for them to be enacted, with a focus on edge cases: 

4. [x] Follow TDD principles learnt in Week 1 (**RED, GREEN, REFACTOR philosophy & the 3 A's**) to build the Classes, starting with the simplest Class first

5. [x] Continue to build until all specifications are met while maintaining 100 Coverage throughout

6. [x] Draft my APPROACH-README.md

7. [x] Attempt Bonus feature test (multiple planes landing and taking off)

8. [x] Update APPROACH-README.md accordingly

9. [x] Run RuboCop and remove highlighted deficiencies (I realise I could/should of done this before every commit, will add this to my commit process)

10. [x] Update APPROACH-README.md where necessary

11. [x] Submit pull request (as early as possible)
 ---

### Functional Representational Diagram

| Object | Message |
| ----------- | ----------- |
| Weather* | stormy? |
| Plane | landed, taken_off, flying? |
| Airport | capacity, weather*, plane, full?, checks_for(plane), land(plane), take_off(plane)  |

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

I then realised I could utilise a seperate Weather class (result in higher cohesion) and thus went about wholescale changes after this [commit](https://github.com/rjkviegas/airport_challenge/commit/e12294e5fc70e3ee4f070fa80114380217f5d5c8).

In hindsight I would of preferred to of coded the Weather class as follow (and I just tried to change it but couldn't get the test in weather_spec.rb to work):

```
class Weather
  def initialize
    rand(1..5) == 1 ? @weather = "stormy' : @weather = "sunny"
  end
  
  def stormy?
    @weather == "stormy" ? true : false
  end
end
```

Q: Would the above of been better? The idea behind it being to not have the @weather variable for Airport objects to be either true or false, as it is not clear what time means unless you know it is in relation to it being stormy or not. Perhaps changing the name of the Airport instance variable to @storm would make it clearer as what the true/false value refers to? Then again are these meant to be hidden by being made private. I ommitted private methods as my tests do not work with them.

Q: I also attempted the BONUS test and know it is terribly long winded, I couldn't figure out a way to create multiple planes to then use to show multiple planes can land and take_off, while showing the correct ones have left and no longer at the airport, and the same plane cannot leave twice.

#### How to create an airport, a plane and have the plane land and take_off

```
$ irb
>> airport = Airport.new
=> #<Airport:0x00007faf6f174618 @capacity=100, @weather=false, @planes=[]>
>> plane = Plane.new
=> #<Plane:0x00007faf6f17cb60>
>> airport.land(plane)
=> [#<Plane:0x00007faf6f17cb60 @flying=false>]
>> airport.take_off(plane)
=> #<Plane:0x00007faf6f17cb60 @flying=true>
```

### User Stories & Relevant Tests ### 
```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

Test: Airport #checks_for(plane) tests whether a specific plane is at the airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

Test: Airport #take_off(plane) tests that a plane leaves airport upon take_off

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

Test Airport #land(plane=Plane.new) tests an error is raised if a plane tries to land if the airport is at capacity

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

Test: Airport #capacity capacity can be set by user

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

Test: Airport #take_off(plane) tests an error is raised if take_off attempted during stormy weather

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 

Test: Airport #land(plane=Plane.new) tests that an error is raised if a plane tries to land if weather is stormy?
```
Just matching the tests with the user stories it is very apparent to me I need to definitely improve the specificity of my tests in relation to the user specification. I need to focus on developing how to form the specific test from the user specification.