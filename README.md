[![Build Status](https://travis-ci.org/jbropho/airport_challenge.svg?branch=master)](https://travis-ci.org/jbropho/airport_challenge)

# Airport-Challenge 
## Makers Academy weekend challenge to produce an object oriented program with TDD in Ruby. 

## Usage
```
git clone https://github.com/jbropho/airport_challenge
bundle install
cd airport_challenge
irb
```

```
2.5.0 :001 > require './lib/airplane.rb'
2.5.0 :002 > require './lib/airport.rb'
2.5.0 :003 > require './lib/traffic_controller.rb'
2.5.0 :004 > manchester = Airport.new
 => #<Airport:0x00007fcb559e2550 @max_capacity=100, @weather=#<Weather:0x00007fcb559e2528 @current=:calm>, @hangar=[]>
2.5.0 :005 > planeA = Airplane.new
=> #<Airplane:0x00007fcb559c3f38 @in_flight=false>
2.5.0 :006 > controller = TrafficController.new
 => #<TrafficController:0x00007fcb55a05168>
2.5.0 :007 > planeA.take_off
 => true
2.5.0 :008 > planeA
 => #<Airplane:0x00007fcb559c3f38 @in_flight=true>
2.5.0 :009 > controller.make_landing(planeA, manchester)
 => false
2.5.0 :010 > manchester
 => #<Airport:0x00007fcb559e2550 @max_capacity=100, @weather=#<Weather:0x00007fcb559e2528 @current=:calm>, @hangar=[#<Airplane:0x00007fcb559c3f38 @in_flight=false>]>
2.5.0 :011 > planeA
 => #<Airplane:0x00007fcb559c3f38 @in_flight=false>
```

## Approach
I used this task as an opportunity to practice the advice given in Sandi Metz's book 'POODR',
which recommends making the smallest number of design decisions needed to satisfy project requirements
to allow flexibility in the future of the application.

## Tech
* ruby
* rspec 
* byebug 

## Testing 
  ```
  $ rspec 
  ```

## Positives 
* Starting to feel comfortable with TDD
* Learned how to use stubs and mocks more fully

## Goals for the week ahead
* Achieve > 95% test coverage (current is 94%)
* Develop a stronger process for turning requirments into simple plans
* Implement full feature test 

