# Airport Challenge

===================

``````
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

``````

# Task

---

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. Here are the user stories that we worked out in collaboration with the client:

1

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```

| #Object |  #Message   |
| :-----: | :---------: |
| Airport | land(plane) |
|  Plane  |             |

2

```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

| #Object |    #Message     |
| :-----: | :-------------: |
| Airport | take_off(plane) |
|  Plane  |    taken_off    |
|         |     landed      |
|         |   in_airport?   |

3

```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```

| #Object |           #Message           |
| :-----: | :--------------------------: |
| Airport | initialize(default_capacity) |
|         |            full?             |
|  Plane  |         raise_error          |

4

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

| #Object |          #Message           |
| ------: | :-------------------------: |
| Airport | initialize(custom_capacity) |
|   Plane |         raise_error         |

5

```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```

| #Object |    #Message     |
| :-----: | :-------------: |
| Weather |     stromy?     |
| airport | take_off(plane) |

6

```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```

| #Object | #Message |
| :-----: | :------: |
|         |          |
|         |          |

# **_ Notes and Thoughts _**

I was really unsure on how to approach the user stories: does the plane have a method to land(airport) (like land at the airport) or is it the airport has a method to land planes...
In Doubt, I decided to test and implement each story in similar way to the user's stories on the week's challenge (Boris_Bikes) and use method to update the plane status by creating several methods.

## USER STORY ONE

we have an Airport class.
we have a Plane class.
Airport can instruct planes to land and take_off

- land(plane)

## USER STORY TWO

Airport can instruct planes to take_off

- take_off(plane) -> update plane's status : plane.has_taken_off
  Airport can instruct planes to land and take_off
- land(plane) -> update plane's status : plane.has_taken_off

Plane can give updates about its status

- in_airport?
  Plane can update about its status:
- has_landed
- taken_off

**COVERAGE: 93.75% -- 30/32 lines in 4 files**
what is missing ? :(

- maybe edge cases:
  there is no plane to take_off ? -> raise_error
  there are too many plane in the airport ? user story 3
- maybe the airport received not explicit confirmation when a plane takes off or lands:
  adding an explicit message : plane has takeoff / plane has landed

**_COVERAGE: 94.12% -- 32/34 lines in 4 files_**
6 examples, 0 failures

```
+----------+----------------+-------+--------+---------+
| coverage | file           | lines | missed | missing |
+----------+----------------+-------+--------+---------+
|  80.00%  | lib/airport.rb | 5     | 1      | 7       |
|  88.89%  | lib/plane.rb   | 9     | 1      | 17      |
+----------+----------------+-------+--------+---------+
```

Not sure what is missing...
I've added two test cases to make sure Plane respond_to :landed and :taken_off
I also run rubocop and had to change the name of my predictated methods : has_landed to landed and has_taken_off to taken_off
not the best names but slightly better.

## USER STORY THREE and FOUR

Airport has an initialize method set to a default CAPACITY
Airport has an instance variable @capacity ->> attr_reader :capacity
!!! What I missed before !!!
the Plane's intance variable :status couldn't be read outside of the Plane Classe because I FORGOT to add the attr_reader at the beginning of the Class...

**_COVERAGE: 95.56% -- 43/45 lines in 4 files_**
7 examples, 0 failures

```
+----------+----------------+-------+--------+---------+
| coverage | file           | lines | missed | missing |
+----------+----------------+-------+--------+---------+
|  90.00%  | lib/plane.rb   | 10    | 1      | 18      |
|  90.91%  | lib/airport.rb | 11    | 1      | 17      |
+----------+----------------+-------+--------+---------+
```

2 file(s) with 100% coverage not shown

Let's add a full? method to avoid the airport to land plane when it is full:

**_COVERAGE: 98.04% -- 50/51 lines in 4 files_**
Finished in 0.00968 seconds (files took 0.26931 seconds to load)
8 examples, 0 failures

```
+----------+----------------+-------+--------+---------+
| coverage | file           | lines | missed | missing |
+----------+----------------+-------+--------+---------+
|  93.33%  | lib/airport.rb | 15    | 1      | 24      |
+----------+----------------+-------+--------+---------+
```

Yay we now have an full? method that test if the hangas is full
and we have a guard condition in our land method -> raise an error "Airport is full" if a plane try to land in a full Airport

**_COVERAGE: 98.18% -- 54/55 lines in 4 files_**
Finished in 0.0116 seconds (files took 0.27374 seconds to load)
9 examples, 0 failures

```
+----------+----------------+-------+--------+---------+
| coverage | file           | lines | missed | missing |
+----------+----------------+-------+--------+---------+
|  93.33%  | lib/airport.rb | 15    | 1      | 25      |
+----------+----------------+-------+--------+---------+
```

3 file(s) with 100% coverage not shown

Good we have just tested and passed the test to make sure we can set up a customized capacity when we create a new instance of Airport

!!! can't figure out what is happending on line 15 of my lib/airport.rb !!!

**Feature Test**
3.0.2 :001 > airport = Airport.new(4)
=> #<Airport:0x00007fa12a164c48 @capacity=4, @hangar=[]>
3.0.2 :002 > plane = Plane.new
=> #<Plane:0x00007fa12a1673d0 @status=true>
3.0.2 :003 > airport.land(plane)
=> true
3.0.2 :004 > plane = Plane.new
=> #<Plane:0x00007fa12a195500 @status=true>
3.0.2 :005 > airport.land(plane)
=> true
3.0.2 :006 > plane = Plane.new
=> #<Plane:0x00007fa129191ed8 @status=true>
3.0.2 :007 > airport.land(plane)
=> true
3.0.2 :008 > airport.land(plane)
=> true
3.0.2 :009 > airport.full?
=> true
3.0.2 :010 > exit
Swa@Swas-MacBook-Pro airport_challenge % irb -r ./lib/airport.rb  
3.0.2 :001 > airport = Airport.new(4)
=> #<Airport:0x00007fb47098a7e8 @capacity=4, @hangar=[]>
3.0.2 :002 > plane1 = Plane.new
=> #<Plane:0x00007fb470991c50 @status=true>
3.0.2 :003 > plane2 = Plane.new
=> #<Plane:0x00007fb47415fee8 @status=true>
3.0.2 :004 > plane3 = Plane.new
=> #<Plane:0x00007fb474856468 @status=true>
3.0.2 :005 > plane4 = Plane.new
=> #<Plane:0x00007fb4741ec870 @status=true>
3.0.2 :006 > airport.land(plane1)
=> true
3.0.2 :007 > airport.land(plane2)
=> true
3.0.2 :008 > airport.land(plane3)
=> true
3.0.2 :009 > airport.land(plane4)
=> true
3.0.2 :010 > plane5 = Plane.new
=> #<Plane:0x00007fb47096ad58 @status=true>
3.0.2 :011 > airport.land(plane5)
/Users/Swa/Desktop/Projects/airport_challenge/lib/airport.rb:13:in `land': Airport is full (RuntimeError) from (irb):11:in `<main>'
from /Users/Swa/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>' from /Users/Swa/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
from /Users/Swa/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
3.0.2 :012 > airport.full?
=> true
3.0.2 :013 > plane1.status
=> true
3.0.2 :014 > plane5.status
=> true

so we create empty airport with a customized capacity. I just wanted to check if it would raise an error once I try to land the fifth plane.
what works:

- raises an error when a plane want to land and the airport is full
- airport knows when it is full
- plane1 is in the airport so its @status is true

to fix :

- plane5 is NOT in the airport though its @status is true...

how to fix this :

1. I can populate the array @hangar in the initialize method from the airport (these planes have a @status of true) and all other planes created outside the airport would have a default @status set to false.
2. or only allow Airport to create instances of plane ? -> maybe the best to test a user journey?
3. set @status to false in the initialize method of Plane.

**_Feature test_**
3.0.2 :001 > airport = Airport.new(3)
=> #<Airport:0x00007fa3659540b0 @capacity=3, @hangar=[]>
3.0.2 :002 > plane1 = Plane.new
=> #<Plane:0x00007fa36593f3e0 @status=false>
3.0.2 :003 > plane2 = Plane.new
=> #<Plane:0x00007fa368191078 @status=false>
3.0.2 :004 > plane3 = Plane.new
=> #<Plane:0x00007fa3681717c8 @status=false>
3.0.2 :005 > plane4 = Plane.new
=> #<Plane:0x00007fa3680cdfd8 @status=false>
3.0.2 :006 > airport.capacity
=> 3
3.0.2 :007 > airport.hangar
=> []
3.0.2 :008 > airport.land(plane1)
=> true
3.0.2 :009 > airport.capacity
=> 3
3.0.2 :010 > airport.hangar
=> [#<Plane:0x00007fa36593f3e0 @status=false>]
3.0.2 :011 > airport.land(plane2)
=> true
3.0.2 :012 > airport.hangar
=>
[#<Plane:0x00007fa36593f3e0 @status=false>,
#<Plane:0x00007fa368191078 @status=false>]
3.0.2 :013 > airport.full?
=> false
3.0.2 :014 > airport.land(plane3)
=> true
3.0.2 :015 > airport.hangar
=>
[#<Plane:0x00007fa36593f3e0 @status=false>,
#<Plane:0x00007fa368191078 @status=false>,
#<Plane:0x00007fa3681717c8 @status=false>]
3.0.2 :016 > airport.full?
=> true
3.0.2 :017 > airport.land(plane4)
/Users/Swa/Desktop/Projects/airport_challenge/lib/airport.rb:13:in `land': Airport is full (RuntimeError) from (irb):17:in `<main>'
from /Users/Swa/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>' from /Users/Swa/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
from /Users/Swa/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
3.0.2 :018 > airport.take_off(plane3)
=> false
3.0.2 :019 > airport.hangar
=>
[#<Plane:0x00007fa36593f3e0 @status=false>,
#<Plane:0x00007fa368191078 @status=false>]
3.0.2 :020 > airport.full?
=> false
3.0.2 :021 > plane3.status
=> false

this is better the plane @status showing if it is in the airport (true) or not (false) is good
also I still have the error message when a plane tries to land in a full airport
the airport knows when it is at full capacity
the @hangar updates properly when planes land or take off.

## USER STORY FIVE

we have to create a new Class for weather.
we use a random number generator to set the weather (example we generate a number with rand(), with a range of 1 to 100,if we get 75 or plus it rains )
HINT: use a DOUBLE in tests to override random weather to ensure consistent test behaviour

# Goals

---

1. Test Drive the creation of a set of classes/modules to satisfy all the users stories
2. Code shoe defend against Edge Cases: planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.
3.

# BONUS

---

Write an RSpec **feature** test that lands and takes off a number of planes

In code review we'll be hoping to see:

- All tests passing
- High [Test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) (>95% is good)
- The code is elegant: every class has a clear responsibility, methods are short etc.
