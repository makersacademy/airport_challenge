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

### Task

We were asked to write a program to control the flow of planes at an airport.

I aimed to complete this challenge by using a test-driven approach, using manual feature tests within IRB and automated unit tests using RSpec.

We were given user stories, which I first broke down using domain modelling. My resulting models were then converted into failing feature tests, then translated into RSpec as failing unit tests. Following that, I wrote my code.

Care has been taken to ensure encapsulation was done as much as possible, so that the user (Air Traffic Controller) can only interact with an instance of the Airport class.

### Installation

Clone repository:
```
$ git clone git@github.com:nazwhale/airport_challenge.git
$ cd airport_challenge
```

Install dependencies with bundle:
```
$ gem install bundler
$ bundle install
```

### Use example

<!-- Update to add instructions of how app is used from a users perspective, with IRB transcript -->
<!-- add user stories -->
To land a plane, then take it off again in IRB:

```
$ irb
2.2.3 :001 > require './lib/airport'
 => true
2.2.3 :002 > require './lib/plane'
 => false
2.2.3 :003 > require './lib/weather'
 => false
2.2.3 :004 > airport = Airport.new
 => #<Airport:0x007fab8f87fae0 @planes_in_airport=[], @capacity=20>
2.2.3 :005 > plane = Plane.new
 => #<Plane:0x007fab8f86d6b0 @flying=true>
2.2.3 :006 > airport.land(plane)
 => [#<Plane:0x007fab8f86d6b0 @flying=false>]
2.2.3 :007 > airport.take_off(plane)
RuntimeError: Too stormy to take off
	from /Users/nadeemmalik/airport_challenge/lib/airport.rb:29:in `take_off'
	from (irb):7
	from /Users/nadeemmalik/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :008 > airport.take_off(plane)
 => #<Plane:0x007fab8f86d6b0 @flying=true>
```

### Domain model

Functional representation:

| Objects                  | Messages                 |
| ------------------------ | ------------------------ |
| Air Traffic Controller   |            |
| Plane                    | plane_lands         |
| Airport                  | land(plane)             |
| Plane                    | plane_takes_off          |
| Airport                  | take_off(plane)            |
| Plane                    | flying?          |
| Weather                  | stormy?         |
| Airport                  | full?           |
| Airport                  | default_capacity          |

Diagram of communication between objects and messages:

```
Plane          <--- plane_lands      ---> plane status no longer flying
Airport        <--- land(plane)      ---> plane lands
Plane          <--- plane_takes_off  ---> plane status flying
Airport        <--- take_off(plane)  ---> plane takes off
Plane          <--- flying?          ---> true/false
Weather        <--- stormy?          ---> true/false
Airport        <--- full?            ---> true/false
Airport        <--- default_capacity ---> default capacity
```

### To be completed

Unfortunately, I did not have time to resarch testing Modules with rspec. As a result, there are currently no tests for my weather.rb module. The reason it exists is because it was originally created, test-driven, as a class.
