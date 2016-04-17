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

## Introduction

This program simulates an air traffic control system that allows planes land and take off at an airport under certain weather conditions.


## Features

* [ ] Plane status
* [ ] Plane landing
* [ ] Plane takeoff
* [ ] Storms prevent landing
* [ ] Storms prevent takeoff
* [ ] Full airport cannot land planes
* [ ] Variable and default capacity
* [ ] Errors raised for inconsistent actions

## Instructions


Clone this repo:

`$ git clone git@github.com:sitypop/airport_challenge.git`

Change to airport_challenge directory, open irb and require the airport.rb file:

```
$ cd airport_challenge
$ irb
2.2.3 :001 > require "./lib/airport.rb"
 => true
 ```

Now we can build airports:

 ```
 2.2.3 :002 > gatwick = Airport.new(20)
 => #<Airport:0x007fe94b8e70d8 @capacity=20, @planes=[], @weather=#<Weather:0x007fe94b8e7088>>
2.2.3 :003 > heathrow = Airport.new(10)
 => #<Airport:0x007fe94b8d67b0 @capacity=10, @planes=[], @weather=#<Weather:0x007fe94b8d6738>>
  ```

And planes:

```
2.2.3 :004 > easyjet = Plane.new
 => #<Plane:0x007fe94b8c71c0 @landed_status=false>
2.2.3 :005 > ryanair = Plane.new
 => #<Plane:0x007fe94b8b5790 @landed_status=false>
 ```

 See how they fly (`@landed_status=false`). Let's land the planes now:

```
 2.2.3 :006 > gatwick.land(easyjet)
 => [#<Plane:0x007fe94b8c71c0 @landed_status=true>]
 2.2.3 :007 > heathrow.land(ryanair)
RuntimeError: Too stormy to land
	from /Users/sity/Desktop/Week_5_Projects/airport_challenge/lib/airport.rb:18:in `land'
	from (irb):8
	from /Users/sity/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
```
Oops, it looks like it is too stormy to land in Heathrow today! Typical.

Now let's take off, and fly me to the moon.

```
2.2.3 :009 > gatwick.take_off(easyjet)
 => #<Plane:0x007fe94b8c71c0 @landed_status=false>
 ```

I have considered edge cases to ensure the consistency of the air control system so don't try to take off a plane if it is already flying. Duh. 👆


## Testing

 In your terminal, type `$ rspec` under `airport_challenge` directory and it will run all the unit tests in spec files.

 There is also feature_spec.rb file which contains all the feature tests for user stories. To solely run these, type the following:

 `$ rspec spec/feature_spec.rb`


## Tools


 * Ruby
 * RSpec


## Author


 Sity Shah
