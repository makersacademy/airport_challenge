# Airport Challange

## Task
Create a mock software to control flow of planes at an air port using users stories.

## Motivation
Learn the principles of TDD by solving the airport challenge. Get use to the syntax of RSpec and be able to create unit tests to recreate the errors from feature tests in irb and then solve those errors by making classes and objects and interacting these objects with each other.

## Learning Outcomes
1. TDD fundamentals
2. RSpec syntax
3. OOPs such as SRP

## Program

#### How to run
```zsh
ruby plane.rb
```
### Process
All class files can be run through plane.rb. user can interact with with a plane object instructing it to land at an airport or take off depending on the capacity and weather conditions.

I took into consideration that weather can be stormy hindering the traffic flow of an air flow thus included guard conditions to prevent landing and taking off a plane during stormy weather using ruby's random number generator `rand` and gave a 20% chance for bad weathers. 

Also i made sure a plane can not land if an airport is full or the plane is already on ground. plane can not be asked to take_off if the plane is already in air.

Since the software is interacting with the plane and not the airport it already makes sure that the plane leaves from the correct airport and can not be landed to a different airport when it's on ground. I did this by adding a predicate `in_air?` on Plane class interface 


### Features
| Syntax | Description | Arguments |
| --- | ----------- | -------- |
|  plane.land(`airport`)| will land the plane in `airport`| takes 1 |
| plane.take_off | tells the plane to take off | |

### How it Looks
```irb
2.6.5 :002 > airport = Airport.new
 => #<Airport:0x00007fa6ae900540 @hanger=[], @capacity=1, @weather=#<Weather:0x00007fa6ae9004f0>>
2.6.5 :003 > plane = Plane.new
 => #<Plane:0x00007fa6ae8408f8>
2.6.5 :004 > plane.land(airport)
 => #<Airport:0x00007fa6ae900540 @hanger=[#<Plane:0x00007fa6ae8408f8 @on_ground=#<Airport:0x00007fa6ae900540 ...>>], @capacity=1, @weather=#<Weather:0x00007fa6ae9004f0>>
2.6.5 :005 > plane.take_off
 => #<Plane:0x00007fa6ae8408f8 @on_ground=nil>
```