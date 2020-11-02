Airport Challenge
=================

```
        ______
        _\____\____
=  = ==(__MEL AIR__)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

About
---------

This is a repo of my first weekend challenge at Makers.

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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

```
Goals
---------

My goals for the weekend challenge were:

* To be able to write a meaningful test, based on the user requirements. I'll then be able to write code using TDD, to make the test pass.
* I'll setup and structure a new Ruby project, and turn user requirements into working code.
* When my code doesn't work, I'll be able to apply a consistent process to resolve the issue.

Process
---------
I converted the User Story into a Domain Model and here is a functional representation of that story:

| Objects         | Messages      |
| :------------   | :----------:  |
| Airport         | full? empty?  |
| Plane           | land, take_off|
| Weather         | generate      |

I followed the TDD approach and didn't write any application code in the editor without writing a test FIRST. We want to test-drive our code using unit tests, so we have well-tested code.

The Result
----------

```shell
lib/airport.rb
lib/weather.rb
lib/plane.rb
spec/airport_spec.rb
spec/weather_spec.rb
spec/plane_spec.rb
```
Creating Airports and changing the capacity

```shell
2.6.5 :001 > require '~/Projects/airport_challenge/lib/airport.rb'
 => true
2.6.5 :002 > lhr = Airport.new
 => #<Airport:0x00007fa9131f4d70 @plane=[], @capacity=10>
2.6.5 :003 > lgw = Airport.new
 => #<Airport:0x00007fa9131fc8e0 @plane=[], @capacity=10>
2.6.5 :004 > lhr.capacity = 20
 => 20
2.6.5 :005 > lhr
 => #<Airport:0x00007fa9131f4d70 @plane=[], @capacity=20>
```
Creating Planes

```shell
2.6.5 :006 > a380 = Plane.new
 => #<Plane:0x00007fa91321e058>
2.6.5 :007 > b777 = Plane.new
 => #<Plane:0x00007fa9132252e0>
2.6.5 :008 > concord = Plane.new
 => #<Plane:0x00007fa913237a80>
```

Take Off and Land with an Error for Stormy weather

```shell
2.6.5 :006 > lhr.land(a380)
 => [#<Plane:0x00007fb04910e4c8>]
2.6.5 :007 > lhr.land(b777)
 => [#<Plane:0x00007fb04910e4c8>, #<Plane:0x00007fb0499606f8>]
2.6.5 :008 > lhr.take_off(a380)
 => #<Plane:0x00007fb0499606f8>
2.6.5 :009 > lhr.take_off(b777)
Traceback (most recent call last):
        5: from /Users/mel/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        4: from /Users/mel/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        3: from /Users/mel/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):9
        1: from /Users/mel/Projects/airport_challenge/lib/airport.rb:24:in `take_off'
RuntimeError (Cant take off in stormy weather)
```
