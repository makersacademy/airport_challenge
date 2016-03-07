Travis-CI status:
[![Build Status](https://travis-ci.org/makersacademy/airport_challenge.svg?branch=master)](https://travis-ci.org/makersacademy/airport_challenge)

## "WEATHER" TO LAND?

* How do you keep your airport _accident-free_ in bad weather?
* _Human errors_ have led to numerous aircraft accidents in the past...
* What if you can _automate the decision_ whether it is safe to land/take-off?
* And what if it can be achieved via _seamless communication_ between the airport and aircrafts?


## Introduction
WEATHER TO LAND (WTL) is a safeguard programme between a control tower and arriving/departing aircrafts.

It helps air traffic control officers:

1.  to instruct aircrafts to land/take-off in fine weather and to confirm the result
2.  to instruct aircrafts NOT to land/take-off in a stormy weather
3.  to instruct aircrafts NOT to land when the airport is full
4.  to detect any discrepancies between the instruction and the status of an aircraft. For example:
  * landing of an aircraft that is on the ground
  * takeoff of an airbourne aircraft
  * takeoff of an aircraft that does not exist in the dock

It is built to adapt to airports of any size by allowing the user to amend airport capacity accordingly.


## Development
WTL is written in Ruby version 2.2.3 and has been developed using RSpec version 3.2.2 as a platform for behaviour-driven development (BDD). The continuous integration is assessed through Travis-CI with the latest test coverage of 100%.


## Design
The design of WTL involves three classes; Airport, Aircraft and Weather.

The Airport class is able to communicate with other two classes and hence serves as a main interface for the user. From the Airport class, the user is able to instruct an aircraft to (or not to) land and takeoff depending on the status of the aircraft and the weather conditions.

### Overview of class interaction
```
                             ____User____               
 __________                 |            |                 _________
| Aircraft |  check status  |   Airport  | check weather  | Weather |
|__________| <------------- | check dock | -------------> |_________|
                            |____________|
                                   |
                                   v
                      decision on landing/takeoff
```

## Classes
Detailed descriptions for methods within each class are given below.

### Airport class methods
#### - initialize
It takes one optional argument: capacity

It creates an airport with a dock as an empty array. The default capacity of the dock is set at 5. The default capacity can be overridden given a value when creating a new airport.
```
2.2.3 :002 > airport1 = Airport.new
 => #<Airport:0x007fd0d982d9b0 @capacity=5, @dock=[]>
2.2.3 :003 > airport2 = Airport.new 20
 => #<Airport:0x007fd0d90b0408 @capacity=20, @dock=[]>
```
#### - land
It takes two arguments: aircraft (compulsory), weather (optional)

If no weather is given, it creates a random weather. It instructs the specified aircraft to (or not to) land, depending on the result of calling a private can_land? method.

If no error is raised by can_land?, it
* calls a change_status method on the aircraft
* stores the aircraft to the dock
* display a message confirming the landing

```
  If airport1 instructs already landed aircraft1 to land...

  2.2.3 :007 > aircraft1
   => #<Aircraft:0x007f88f28a3608 @landed=true>
  2.2.3 :008 > airport1.land aircraft1
  RuntimeError: The aircraft is already on the ground
```
```
  If airport1 instructs airbourne aircraft2 to land and sunny...

  2.2.3 :009 > aircraft2
   => #<Aircraft:0x007f88f2891f20 @landed=false>
  2.2.3 :010 > airport1.land aircraft2
 => "The aircraft has landed safely to the airport"
```
```
  If airport1 is full and instructs aircraft2 to land...

  2.2.3 :011 > aircraft2
   => #<Aircraft:0x007f88f2891f20 @landed=false>
  2.2.3 :012 > airport1
   => #<Airport:0x007ff6f103ac60 @capacity=5, @dock=["aircraft", "aircraft", "aircraft", "aircraft", "aircraft"]>
  2.2.3 :013 > airport1.land aircraft2
  RuntimeError: Unable to instruct landing as the airport dock is full
```
```
  If airport1 instructs airbourne aircraft2 to land and stormy...

  2.2.3 :014 > aircraft2
   => #<Aircraft:0x007f88f2891f20 @landed=false>
  2.2.3 :015 > airport1.land aircraft2
  RuntimeError: Unable to instruct landing due to severe weather
```

#### - takeoff
It takes two arguments: aircraft (compulsory), weather (optional)

If no weather is given, it creates a random weather. It instructs the specified aircraft to (or not to) takeoff, depending on the result of calling a private can_takeoff? method.

If no error is raised by can_takeoff?, it
* calls a change_status method on the aircraft
* clears the aircraft from the dock
* display a message confirming the takeoff

```
  If the aircraft2 has landed at airport1 but not airport2...

  2.2.3 :008 > airport1.land aircraft2
   => "The aircraft has landed safely to the airport"
  2.2.3 :009 > airport2.takeoff aircraft2
  RuntimeError: Unable to locate the aircraft
```
```
  If the airport1 instructs aircraft2 to take off and sunny...

  2.2.3 :010 > airport1.land aircraft2
   => "The aircraft has landed safely to the airport"
  2.2.3 :011 > airport1.takeoff aircraft2
   => "The aircraft has successfully taken off from the airport"
```
```
  If the airport1 instructs aircraft2 to take off any stormy...

  2.2.3 :010 > airport1.land aircraft2
   => "The aircraft has landed safely to the airport"
  2.2.3 :011 > airport1.takeoff aircraft2
  RuntimeError: Unable to instruct takeoff due to severe weather
```

#### - can_land? (private)
It raises an error in the following three cases:
* When the aircraft is already on the ground
* When the airport dock is full
* When the weather is stormy

#### - can_takeoff? (private)
It raises an error in the following two cases:
* When the aircraft does not exist in the dock
* When the weather is stormy

#### - full (private)
It returns true when the dock is full

### Aircraft class methods
#### - initialize
It creates an aircraft with a default status of airbourne.

#### - change_status
It flips the status of the aircraft between airbourne and landed.

```
2.2.3 :002 > aircraft1 = Aircraft.new
 => #<Aircraft:0x007fc1e1021c00 @landed=false>
2.2.3 :003 > aircraft1.change_status
 => #<Aircraft:0x007fc1e1021c00 @landed=true>
```

### Weather class methods
#### - initialize
It take one optional argument: number

It creates a weather with a default probability of 80% sunny and 20% stormy. When no value is provided, an integer between 1 and 10 is randomly assigned. The weather condition is determined according to the number as follows. The default probability can be overridden when given a number.
* 1 or 2: stormy
* 3 to 10: sunny


## Authour
Misa Ogura
