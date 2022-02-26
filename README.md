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

Instructions
---------

* Lets fly some planes! Start by creating instances of the Airport class and the Plane class as shown below:

```
$ irb
2.2.3 :001 > airport = Airport.new
 => #<Airport:0x007fafdb81ea88 @capacity=10, @hangar=[]>
2.2.3 :002 > plane = Plane.new
 => #<Plane:0x007fafdb0041b8>
2.2.3 :003 >
```
* Try landing a plane:

```
2.2.3 :003 > airport.land(plane)
 => [#<Plane:0x007fafdb0041b8>]
2.2.3 :004 >
```
* And taking off:

```
2.2.3 :004 > airport.take_off
 => #<Plane:0x007fafdb0041b8>
2.2.3 :005 >
```
* Warning Storms! With bad weather we keep the planes grounded and we don't accept any new planes

```
2.2.3 :005 > airport.land(plane)
~/Projects/airport_challenge/lib/airport.rb:16:in `land': Cannot land due to storm (RuntimeError)
```

My Task
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
