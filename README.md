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

About a program
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

My approach
---------

My solution for this program consist of 3 classes:
* Airport: is able to instruct planes to land and take off, taking into account weather conditions and capacity of the airport. It also reports status of the planes.
* Plane: it creates instance plane objects with their status.
* Weather: it creates generated randomly weather

Steps
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`

Instruction for user
---------------------
This program allows you to create airports, planes and generate a weather.
It will let you land and take off plane from the airport, depending on weather conditions and capacity of the airport. It will not let you land already landed plane or take off if there is no planes at the airport.
You can also check if plane is flying or landed at the airport, and see the all the planes you have landed.

To start a program in IRB

* require files
```
$ irb
2.5.0 :001 > require './lib/airport'
 => true
2.5.0 :002 > require './lib/plane'
 => true
2.5.0 :003 > require './lib/weather'
 => true
```
* create Airport, Plane and Weather objects
```
$ irb
2.5.0 :004 > airport = Airport.new
 => #<Airport:0x00007fa1ff13b8e0 @capacity=50, @planes=[]>
2.5.0 :005 > plane = Plane.new
 => #<Plane:0x00007fa1ff11ae38 @flying=true>
2.5.0 :006 > weather = Weather.new
 => #<Weather:0x00007fa1fe80fcf8 @weather=:sunny>
```

Methods
---------
airport.capacity - returns capacity of the airport, which is set to default 50.
To overwrite it pass capacity of your choice as parameter when create new airport
eg.
```
$ irb
2.5.0 :007 > airport = Airport.new(30)
 => #<Airport:0x00007f8aa2194018 @capacity=30, @planes=[]>
 ```
airport.land(plane, weather) - lands a plane at the airport if weather allows
airport.takeoff(plane, weather) - takes off a plane from the airport if weather allows
weather.stormy? - checks the weather and returns true if weather conditions are bad
plane.landing and plane.flying - changes status of the plane, it starts with flying status and can be overwritten by plane.landing or by airport.land(plane, weather)

Testing
--------
  Rspec
