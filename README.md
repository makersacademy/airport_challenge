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

(updated: 7 Oct 2018 - COVERAGE:  97.59% -- 81/83 lines in 6 files)

Installation
-------

1. Fork this repo, and clone to your local machine
1. When the installation completes, run `bundle`


Usage
---------

Here's how you might explore the application using something like IRB:

```
$ irb --simple-prompt
>> require './lib/controller'
=> true
>> require './lib/airport'
=> true
>> require './lib/plane'
=> true
>> plane_1 = Plane.new("BA178")
=> #<Plane:0x00007f94bd0d4dd8 @name="BA178", @landed=false>
>> airport_1 = Airport.new("Heathrow")
=> #<Airport:0x00007f94bd0cc728 @name="Heathrow", @planes=[], @capacity=50>
>> controller = Controller.new
=> #<Controller:0x00007f94bd0a9598>
>> controller.instruct_plane_to_land(plane_1, airport_1)
=> "Landed BA178 at Heathrow!"
>> plane_2, airport_2 = Plane.new("EZY8880"), Airport.new("Gatwick")
=> [#<Plane:0x00007f94bd0a1438 @name="EZY8880", @landed=false>, #<Airport:0x00007f94bd0a13e8 @name="Gatwick", @planes=[], @capacity=50>]
>> controller.instruct_plane_to_land(plane_2, airport_2)
=> "Landed EZY8880 at Gatwick!"
>> controller.instruct_plane_to_take_off(plane_1, airport_1)
=> "BA178 taken off from Heathrow!"
>>
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
