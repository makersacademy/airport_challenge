Airport Challenge - Solution
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```
## My approach to the solution

This challenge was solved using the London School style of Test Driven Development.

Tests were created and defined by the information provided on each user story. This helped identify what kind of behaviour I wanted each class/method to achieve and also provided reassurance that the code which was (eventually) written met the brief in the user story.

Effort was made to ensure the code is as DRY as possible and also that each method/class had a single responsibility. 

There is 100% test coverage and unit tests are isolated from other classes. Many feature tests have been completed in IRB throughout completion of this challenge to ensure edge cases are identified and resolved.

## Getting started

`git clone https://github.com/r94o/airport_challenge.git`

## Usage

`irb -r ./lib/plane.rb`

```
3.0.2 :001 > airport = Airport.new
 => #<Airport:0x00007fb0310e8e20 @capacity=30, @hangar=[]> 
3.0.2 :002 > plane = Plane.new
 => #<Plane:0x00007fb0312b0370 @flying=true> 
3.0.2 :003 > plane.flying?
 => true 
3.0.2 :004 > plane.land(airport)
 => [#<Plane:0x00007fb0312b0370 @flying=false>] 
3.0.2 :005 > plane.take_off(airport)
 => #<Plane:0x00007fb0312b0370 @flying=true> 

```
## Running tests

`rspec` in repo directory