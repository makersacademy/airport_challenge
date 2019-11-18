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

The task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

The code guards against the following edge cases:

* Ensures that planes can only take off from airports they are in
* Ensures that planes that are already flying cannot take off and/or be in an airport
* Ensures that planes that are landed cannot land again and must be in an airport


Getting Started
----------------

Enter irb as follows:

```
$ irb -r './airport_irb_import.rb' 
```

To start using the program, an airport must be defined. The default capacity of an airport is 10 planes, this can be over-ridden using an integer passed to an argument when initializing the Airport. For example, an Airport with a capacity of 20 planes is given below:

```
2.6.0 :001 >  
2.6.0 :002 > jfk = Airport.new(20)
 => #<Airport:0x00007ff9999738b8 @capacity=20, @planes=[]> 
2.6.0 :003 > 
```

When a plane is initialized, it must be associated to an existing Airport:

```
2.6.0 :001 > 
2.6.0 :002 > jfk = Airport.new(20)
 => #<Airport:0x00007ff9999738b8 @capacity=20, @planes=[]> 
2.6.0 :003 > 
2.6.0 :004 > plane1 = Plane.new(jfk)
 => #<Plane:0x00007ff9999e5788 @location=#<Airport:0x00007ff9999738b8 @capacity=20, @planes=[#<Plane:0x00007ff9999e5788 ...>]>, @in_flight=false> 
2.6.0 :005 > 
```

Planes can take-off and land, to do so a specific plane must be specified and the weather conditions must be checked, planes cannot take-off or land when the weather is stormy. For the weather to be checked, a weather object must be specified. This object can then be used to check if the weather is stormy:

```
2.6.0 :006 > weather = Weather.new
 => #<Weather:0x00007ff999a04e30> 
2.6.0 :007 > weather.stormy?
 => true 
2.6.0 :008 > 
```

Note that Weather object has a random condition, which sets the weather to stormy in rare cases (1/100 chance).

A plane can then take-off as follows:

```
2.6.0 :008 > jfk.take_off(plane1, weather)
 => "Plane has taken-off" 
2.6.0 :009 > 
```

Once in flight, an error message will occur if the plane is requested to take off again:

```
2.6.0 :010 > jfk.take_off(plane1, weather)
Traceback (most recent call last):
        6: from /Users/abacon/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        5: from /Users/abacon/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        4: from /Users/abacon/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        3: from (irb):10
        2: from /Users/abacon/Projects/makers/week1/airport_challenge/lib/airport.rb:22:in `take_off'
        1: from /Users/abacon/Projects/makers/week1/airport_challenge/lib/airport.rb:44:in `take_off_checks'
RuntimeError (Plane already in flight)
```

To land a plane, again the airport, plane and weather are required to be specified.

```
2.6.0 :013 > heathrow = Airport.new(15)
 => #<Airport:0x00007ff999921518 @capacity=15, @planes=[]> 
2.6.0 :014 > 
2.6.0 :015 > heathrow.land_plane(plane1, weather)
 => [#<Plane:0x00007ff9999e5788 @location=#<Airport:0x00007ff9999738b8 @capacity=20, @planes=[]>, @in_flight=false>]
```

Once a plane is landed, it cannot land again until it has taken off (this also prevents a plane from being at more than 1 airport):

```
2.6.0 :023 > heathrow.land_plane(plane1, weather)
Traceback (most recent call last):
        6: from /Users/abacon/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        5: from /Users/abacon/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        4: from /Users/abacon/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        3: from (irb):23
        2: from /Users/abacon/Projects/makers/week1/airport_challenge/lib/airport.rb:15:in `land_plane'
        1: from /Users/abacon/Projects/makers/week1/airport_challenge/lib/airport.rb:51:in `landing_checks'
RuntimeError (Plane already on the ground)
2.6.0 :024 > 
```

Impovements
-------------

Although the original set of user stories have been addressed, there are a number of improvements that could be made to the software:

* Plane objects could hold their current location when on the ground, and their destination when in flight
* Planes have sizes and Airports have limited capacity for certain aircraft size
* Could have an "in_flight" or "sky" object, which holds all the planes in flight
* save / backup the current conditions in case of a software crash
* etc




