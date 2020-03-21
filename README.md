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

Task
-----

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

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.


**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Implementation of features
--------
### User story 1

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```

#### Feature - instruct plane to land at an airport

Exercise feature using irb:

```bash
2.6.5 :001 > require './lib/plane'
 => true 
2.6.5 :002 > plane = Plane.new
 => #<Plane:0x00007ffab090d5c8 @landed=false, @current_airport=nil> 
2.6.5 :003 > airport = Airport.new
 => #<Airport:0x00007ffab08f5518 @capacity=10, @planes_landed=0> 
2.6.5 :004 > weather = Weather.new
 => #<Weather:0x00007ffab08318c0> 
2.6.5 :005 > plane.land(airport, weather)
 => true 
```

### User story 2

```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

#### Feature - instruct plane to take off from an airport and confirm it is no longer at the airport

Exercise feature using irb:

```bash
2.6.5 :001 > require './lib/plane'
 => true 
2.6.5 :002 > plane = Plane.new
 => #<Plane:0x00007fb89d88be60 @landed=false, @current_airport=nil> 
2.6.5 :003 > airport = Airport.new
 => #<Airport:0x00007fb89d860b20 @capacity=10, @planes_landed=0> 
2.6.5 :004 > weather = Weather.new
 => #<Weather:0x00007fb89e031480> 
2.6.5 :005 > plane.land(airport, weather)
 => true 
2.6.5 :006 > plane.take_off(weather)
 => "No longer in the airport"  
```

### User story 3

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
```

#### Feature - if the airport is full, it should prevent planes from landing

Exercise feature using irb:

```bash
2.6.5 :001 > require './lib/plane'
 => true 
2.6.5 :002 > airport = Airport.new
 => #<Airport:0x00007fa098888250 @capacity=10, @planes_landed=0> 
2.6.5 :003 > weather = Weather.new
 => #<Weather:0x00007fa09702ff78> 
2.6.5 :004 > 10.times do
2.6.5 :005 >     plane = Plane.new
2.6.5 :006?>   plane.land(airport, weather)
2.6.5 :007?>   end
 => 10 
2.6.5 :008 > plane = Plane.new
 => #<Plane:0x00007fa09890a070 @landed=false, @current_airport=nil> 
2.6.5 :009 > plane.land(airport, weather)
Traceback (most recent call last):
        6: from /Users/student/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        5: from /Users/student/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        4: from /Users/student/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        3: from (irb):10
        2: from (irb):10:in `rescue in irb_binding'
        1: from /Users/student/projects/airport_challenge/lib/plane.rb:11:in `land'
RuntimeError (Unable to land, airport is full)
```

### User story 4

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate`

```

#### Feature - aiports have a default capacity that can be overriden

Exercise feature using irb:

```bash
2.6.5 :001 > require './lib/plane'
 => true 
2.6.5 :002 > airport = Airport.new
 => #<Airport:0x00007feffa094b00 @capacity=10> 
2.6.5 :003 > airport.capacity
 => 10 
2.6.5 :004 > airport = Airport.new(20)
 => #<Airport:0x00007feff98f6470 @capacity=20> 
2.6.5 :005 > airport.capacity
 => 20 
```

### User story 5

```
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 
```

#### Feature - planes cannot take off when the weather is stormy

Exercise feature using irb:

```
2.6.5 :001 > require './lib/plane'
 => true 
2.6.5 :002 > plane = Plane.new
 => #<Plane:0x00007f9908051d08 @landed=false, @current_airport=nil> 
2.6.5 :003 > airport = Airport.new
 => #<Airport:0x00007f9907134f28 @capacity=10, @planes_landed=0> 
 2.6.5 :004 > weather = Weather.new
 => #<Weather:0x00007f9d820cf160> 
 2.6.5 :005 > plane.land(airport, weather)
 => true 
2.6.5 :006 > plane.take_off(weather)
Traceback (most recent call last):
        5: from /Users/student/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        4: from /Users/student/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        3: from /Users/student/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):5
        1: from /Users/student/projects/airport_challenge/lib/plane.rb:21:in `take_off'
RuntimeError (Unable to take off, stormy weather)
2.6.5 :006 > 
```

### User story 6

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

#### Feature - planes cannot land when the weather is stormy

Exercise feature using irb:

```
2.6.5 :001 > require './lib/plane'
 => true 
2.6.5 :002 > airport = Airport.new
 => #<Airport:0x00007f9d928ed3c0 @capacity=10, @planes_landed=0> 
2.6.5 :003 > plane = Plane.new
 => #<Plane:0x00007f9d930ede08 @landed=false, @current_airport=nil> 
2.6.5 :004 > weather = Weather.new
 => #<Weather:0x00007f9d930cf160> 
2.6.5 :005 > plane.land(airport, weather)
Traceback (most recent call last):
        5: from /Users/student/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        4: from /Users/student/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        3: from /Users/student/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):5
        1: from /Users/student/projects/airport_challenge/lib/plane.rb:13:in `land'
RuntimeError (Unable to land, stormy weather)
2.6.5 :005 > 
```