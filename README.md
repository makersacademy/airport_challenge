Airport Challenge
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

Description
---------

This is the weekend challenge at the end of my first week at Makers Academy, a 16-week software developer bootcamp. For the main instructions, please refer [here](https://github.com/AndreaDiotallevi/airport_challenge/blob/master/INSTRUCTIONS.md).

Prerequisites
-------

* Clone this repository into your machine with ```git clone```
* Change into the new repository
* Open ```irb``` in the terminal

How to run tests
-------

* Run ```bundle``` to install all the dependencies
* Run ```rspec``` in the terminal to run the tests

My approach explanation to solve the challenge
-----

### User story 1:

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```

**Domain model:**

**Objects** | **Messages**
----------- | ---
Airport     | land(plane)
Plane       |

**Feature test:**

```
airport = Airport.new
=> airport
plane = Plane.new
=> plane
airport.land(plane)
=> airport
```

### User story 2:

```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

**Domain model:**

**Objects** | **Messages**
----------- | ---
Airport     | take_off(plane)
Plane       | landed?

**Feature test:**

```
airport = Airport.new
=> airport
plane = Plane.new
=> plane
airport.land(plane)
=> airport
plane.landed?
=> true
airport.take_off(plane)
=> airport
plane.landed?
=> false
```

### User story 3:

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
```

**Domain model:**

**Objects** | **Messages**
----------- | ---
Airport     | full? (private method)

**Feature test:**

```
airport = Airport.new
=> airport
plane = Plane.new
=> plane
airport.land(plane)
=> airport
plane_2 = Plane.new
=> plane_2
airport.land(plane_2)
=> RuntimeError (Cannot land as the airport is full)
```

### User story 4:

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

**Domain model:**

**Objects** | **Instance Variables** | **Constants**
----------- | ---------------------- | ---
Airport     | capacity               | DEFAULT_CAPACITY = 50

**Feature test:**

```
airport = Airport.new(10)
=> airport
10.times { airport.land(Plane.new) }
=> 10
airport.land(Plane.new)
=> RuntimeError (Cannot land as the airport is full)
```

### User story 5:

```
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 
```

**Domain model:**

**Objects** | **Messages**
----------- | ---
Airport     | take_off(plane)
Plane       |
Weather     | stormy?

**Feature test:**

```
airport = Airport.new
=> airport
airport.take_off(Plane.new)
=> RuntimeError (Cannot take off due to stormy weather)
```

### User story 6:

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

**Domain model:**

**Objects** | **Messages**
----------- | ---
Airport     | land(plane)
Plane       |
Weather     | stormy?

**Feature test:**

```
airport = Airport.new
=> airport
plane = Plane.new
=> plane
airport.land(plane)
=> RuntimeError (Cannot land due to stormy weather)
```

RSpec tests tree
---------

```
Airport
  has a default capacity
  #initialize
    should be able to override the instance variable capacity
  #land
    when the weather is stormy
      should raise an error
    when the weather is not stormy
      should be able to land one plane and confirm that it is now in the airport
      should raise an error if the airport is full
      should raise an error if the plane has already landed
  #take_off
    when the weather is stormy
      should raise an error
    when the weather is not stormy
      should be able to take off a plane and confirm it is no longer in the airport
      should raise an error if the plane has not landed in this airport

Plane
  #landed?
    should return a boolean
  #land
    should return true
  #take_off
    should return false

Weather
  #stormy?
    should return a boolean
```

Full implementation in `irb`
---------

```
$ irb
2.6.0 :001 > require "./lib/airport"
 => true
2.6.0 :002 > require "./lib/plane"
 => true 
2.6.0 :003 > require "./lib/weather"
 => true
2.6.0 :004 > airport = Airport.new
 => #<Airport:0x00007fcb1a13ca58 @capacity=50, @weather=#<Weather:0x00007fcb1a13ca30>, @planes=[]> 
2.6.0 :005 > plane = Plane.new
 => #<Plane:0x00007fcb1a8705b8 @landed=false> 
2.6.0 :006 > airport.land(plane)
Traceback (most recent call last):
        5: from /Users/student/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        4: from /Users/student/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        3: from /Users/student/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):9
        1: from /Users/student/Code/makersacademy/airport_challenge/lib/airport.rb:14:in `land'
RuntimeError (Cannot land due to stormy weather)
2.6.0 :007 > airport.land(plane)
 => #<Airport:0x00007fcb1a13ca58 @capacity=50, @weather=#<Weather:0x00007fcb1a13ca30>, @planes=[#<Plane:0x00007fcb1a8705b8 @landed=true>]> 
2.6.0 :008 > airport.take_off(plane)
Traceback (most recent call last):
        5: from /Users/student/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        4: from /Users/student/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        3: from /Users/student/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):25
        1: from /Users/student/Code/makersacademy/airport_challenge/lib/airport.rb:24:in `take_off'
RuntimeError (Cannot take off due to stormy weather)
2.6.0 :009 > airport.take_off(plane)
 => #<Airport:0x00007fcb1a13ca58 @capacity=50, @weather=#<Weather:0x00007fcb1a13ca30>, @planes=[]>
2.6.0 :010 > airport.land(plane)
 => #<Airport:0x00007fcb1a13ca58 @capacity=50, @weather=#<Weather:0x00007fcb1a13ca30>, @planes=[#<Plane:0x00007fcb1a8705b8 @landed=true> 
2.6.0 :011 > airport.land(plane)
Traceback (most recent call last):
        6: from /Users/student/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        5: from /Users/student/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        4: from /Users/student/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        3: from (irb):31
        2: from (irb):31:in `rescue in irb_binding'
        1: from /Users/student/Code/makersacademy/airport_challenge/lib/airport.rb:16:in `land'
RuntimeError (Cannot land as the plane has already landed)
2.6.0 :012 > plane_2 = Plane.new
 => #<Plane:0x00007fcb1a126550 @landed=false>
2.6.0 :013 > airport.take_off(plane_2)
Traceback (most recent call last):
        6: from /Users/student/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        5: from /Users/student/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        4: from /Users/student/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        3: from (irb):59
        2: from (irb):59:in `rescue in irb_binding'
        1: from /Users/student/Code/makersacademy/airport_challenge/lib/airport.rb:25:in `take_off'
RuntimeError (Cannot take off as plane not landed)
2.6.0 :014 > airport_2 = Airport.new
 => #<Airport:0x00007fcb1a871da0 @capacity=50, @weather=#<Weather:0x00007fcb1a871d28>, @planes=[]> 
2.6.0 :015 > plane_4 = Plane.new
 => #<Plane:0x00007fcb1a900078 @landed=false> 
2.6.0 :016 > airport_2.land(plane_4)
 => #<Airport:0x00007fcb1a8b0d20 @capacity=1, @weather=#<Weather:0x00007fcb1a8b0cf8>, @planes=[#<Plane:0x00007fcb1a900078 @landed=true>]> 
2.6.0 :017 > airport_2.land(Plane.new)
Traceback (most recent call last):
        6: from /Users/student/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        5: from /Users/student/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        4: from /Users/student/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        3: from (irb):71
        2: from (irb):71:in `rescue in irb_binding'
        1: from /Users/student/Code/makersacademy/airport_challenge/lib/airport.rb:15:in `land'
RuntimeError (Cannot land as the airport is full)
