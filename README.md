## Airport Challenge

![Build Status](https://travis-ci.com/mikjw/airport_challenge.svg?branch=master)

The first weekend challenge at Makers Academy: use test-driven development to write a simple command line app to control the flow of traffic at an airport.  



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



### The specification 

* Create an airport from which planes can land and take off
* Keep track of whether planes are in the air
* Random airport weather: normally sunny, but sometimes stormy; planes cannot land or take off if weather is stormy
* Airports have a default capacity which can be varied on instantiation
* Planes cannot land in an airport that is full

Full instructions and user stories in [Instructions](https://github.com/mikjw/airport_challenge/blob/master/Instructions.md)
<br>



### To run

```
Michaels-MacBook-Pro-2:airport_challenge michael$ irb
2.6.0 :001 > require './lib/airport.rb'
 => true 
2.6.0 :002 > gatwick = Airport.new 
 => #<Airport:0x00007ff95b8f7120 @capacity=10, @planes=[]> 
2.6.0 :003 > plane_1 = Plane.new
 => #<Plane:0x00007ff95b0d8bd8 @in_flight=false> 
2.6.0 :004 > gatwick.take_off(plane_1)
 => "Confirming departure" 
2.6.0 :005 > gatwick.land(plane_1)
 => false 
2.6.0 :006 > gatwick.land(plane_1)
Traceback (most recent call last):
        6: from /Users/michael/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        5: from /Users/michael/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        4: from /Users/michael/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        3: from (irb):6
        2: from /Users/michael/Projects/airport_challenge/lib/airport.rb:29:in `land'
        1: from /Users/michael/Projects/airport_challenge/lib/plane.rb:17:in `land'
RuntimeError (Cannot land - not in flight)
2.6.0 :007 > 
```


### My approach to the problem 

* Broke down user stories to make model:

| OBJECT | MESSAGE|
|--------|-------|
| plane | take off, land |
| airport | land(plane), take_off(plane) |
| weather | stormy? |

* Started in a REPL with a manual feature test for a `Plane` class, then wrote the first unit test in RSpec, watched it fail and wrote the code the make it pass.
* Followed the RED-GREEN-REFACTOR cycle to continue creating the necessary classes and methods to complete the user stories.
* Final tidy-up with Rubocop.


#### To do 
* Although for simplicity I decided to keep `weather` as a method on the Airport class, returning to this problem I would like to make this its own class - primarily for extensibility, as well as to separate concerns.
* Tidy test suite be removing `responds_to` tests that are no longer needed.
* Defend against further edge cases - e.g. by having planes rememeber specifically which airport they have landed in and not just that they are no longer 'in flight'.
<br>

Returning to the project the following week to update the README and add Travis CI, I found the tests were not detecting a bug in the `land` menthod in the `Airport` class which caused planes not to land. With the bug fixed, some tests failed - solved by using a plane double to the airport spec. With more time the test suite would benefit from further tidying. 
