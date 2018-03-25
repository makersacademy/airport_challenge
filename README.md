[![Build Status](https://travis-ci.org/MaryDomashneva/airport_challenge.svg?branch=master)](https://travis-ci.org/MaryDomashneva/airport_challenge)

The program allowed to manage Airport operations.

Program has an class Airport.
  Airport has:
    1. default plane capacity = 30,
    2. initial number of planes in garage equal the default capacity,
    3. weather condition which is mostly sunny, but occasionally stormy.
  Airport can take-off and land planes. It has two methods called 'take_off_plane' and 'land_plane'.
    Plane can be landed if there is flying plane, airport is not full (number of planes in garage is less than default number) and the weather is sunny.
    Plane can be taken-off if there is a plane in garage and weather is sunny.
    When weather is stormy neither landing of taken-off can be proceed.
  Airport also has two private methods: 'full?' and 'empty?' which are checking the if garage full or empty.


Wether conditions are defined by another class Weather.
  Class Weather has method 'stormy?' which returns weather condition.
  Wether condition is set randomly from 100% where 90% the weather is sunny and only 10% stormy.

Planes defined as a class Plane.
  Class plane has method 'flying?' which define whether the plane is flying or inside the garage.
    -If plane is flying it can be only landed, but can not be taken-off until landed.
    -If plane is landed it can be only taken-off, but can not be landed again until taken-off.
  Class Plane also has methods that marked plane as landed 'mark_as_landed' or flying 'mark_as_flying'

Exaples:

1  When airport operates and and airport is not full is possible to land plane and mark plane as landed:

  ```
  plane = Plane.new(true)
   => #<Plane:0x00007ff7df03e7b8 @plane_status=true>
  2.5.0 :024 > weather = Weather.new(false)
   => #<Weather:0x00007ff7df1c22b0 @condition=false>
  2.5.0 :025 > airport = Airport.new(0, 30, weather)
   => #<Airport:0x00007ff7df1bab28 @planes_garage=[], @capacity=30, @weather=#<Weather:0x00007ff7df1c22b0 @condition=false>>
  2.5.0 :026 > plane.flying?
   => true
  2.5.0 :027 > airport.land_plane(plane)
   => [#<Plane:0x00007ff7df03e7b8 @plane_status=false>]
  2.5.0 :028 > airport
   => #<Airport:0x00007ff7df1bab28 @planes_garage=[#<Plane:0x00007ff7df03e7b8 @plane_status=false>], @capacity=30, @weather=#<Weather:0x00007ff7df1c22b0 @condition=false>>
  2.5.0 :029 > plane.flying?
   => false
  ```

2  When airport operates and planes are available is possible to take off plane and mark plane as flying:

  ```
2.5.0 :029 > plane.flying?
 => false
2.5.0 :030 > airport.take_off_plane
 => #<Plane:0x00007ff7df03e7b8 @plane_status=true>
2.5.0 :031 > plane.flying?
 => true
2.5.0 :032 > airport
 => #<Airport:0x00007ff7df1bab28 @planes_garage=[], @capacity=30, @weather=#<Weather:0x00007ff7df1c22b0 @condition=false>>
  ```

3 It is not possible to take-off plane, when plane if flying
  ```
  2.5.0 :033 > airport.take_off_plane
Traceback (most recent call last):
        3: from /Users/mariagetmanova/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):33
        1: from /Users/mariagetmanova/Desktop/Makers_Projects/airport_challenge/lib/airport.rb:26:in `take_off_plane'
RuntimeError (No planes available for take-off!)
2.5.0 :034 >
  ```
4 It is not possible to land plane if plane is already landed

```
2.5.0 :034 > airport.land_plane(plane)
 => [#<Plane:0x00007ff7df03e7b8 @plane_status=false>]
2.5.0 :035 > airport.land_plane(plane)
Traceback (most recent call last):
        3: from /Users/mariagetmanova/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):35
        1: from /Users/mariagetmanova/Desktop/Makers_Projects/airport_challenge/lib/airport.rb:34:in `land_plane'
RuntimeError (Landing is not possible!)
2.5.0 :036 >
```
5 It is not possible to take-off plane when the weather is stormy

```
2.5.0 :039 > weather = Weather.new(true)
 => #<Weather:0x00007ff7df1d95f0 @condition=true>
2.5.0 :040 > airport = Airport.new(1, 30, weather)
 => #<Airport:0x00007ff7df1bc5e0 @planes_garage=[#<Plane:0x00007ff7df1bc590 @plane_status=false>], @capacity=30, @weather=#<Weather:0x00007ff7df1d95f0 @condition=true>>
2.5.0 :041 > airport.take_off_plane
Traceback (most recent call last):
        3: from /Users/mariagetmanova/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):41
        1: from /Users/mariagetmanova/Desktop/Makers_Projects/airport_challenge/lib/airport.rb:27:in `take_off_plane'
RuntimeError (Unable to take_off due to stormy weather!)
```
