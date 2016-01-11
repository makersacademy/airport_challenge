![makersacademy](https://github.com/allimac/resources/blob/master/ma_logo.png)

**week 1 / weekend challenge**

# Airport challenge

This is the first of our weekend challenges! We have Saturday and Sunday to create - using our newly learnt skills in Ruby - a simple airport/planes control system.

## User stories

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
 ```

# Implementation

 The implementation was driven by acceptance unit test cycles. The final implementation has 3 classes with defined responsabilities.

## How to use it

 First, clone down this repo to your local machine
 ```
 $ git clone git@github.com:allimac/ma-airport-challenge.git
 ```
To check the tests run rspec
```
$ rspec
```
To play with it open a session in pry or irb:
```
$ pry
```
Require airport class, which will also require plane and weather. Then play around creating planes and airports and making planes land at and take off from the airports you created:
```ruby
[1] pry(main)> require './lib/airport'
[2] pry(main)> jfk = Airport.new(name: "JFK")
[3] pry(main)> mxp = Airport.new(name: "MXP")
[4] pry(main)> plane1 = Plane.new
[7] pry(main)> plane2 = Plane.new
[8] pry(main)> plane3 = Plane.new
[9] pry(main)> plane1.land(jfk)
=> "Landed at JFK!"
[10] pry(main)> plane1.land(jfk)
RuntimeError: This plane is already landed
[11] pry(main)> plane1.takeoff(jfk)
=> "Taking off!"
[12] pry(main)> plane1.takeoff(mxp)
RuntimeError: This plane is already flying
[13] pry(main)> plane2.land(mxp)
=> "Landed at MXP!"
[14] pry(main)> plane3.land(mxp)
=> "Landed at MXP!"
...
```
