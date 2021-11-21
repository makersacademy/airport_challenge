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

Approach
---------

My approach was to break down the problem into two main classes: airport and plane. The general idea is that the user can give the plane specific commands in order to allow the plane to takeoff or land in different airports. Thus, the plane class will have most of the functionality, on the other hand, the airport class acts as more of a container with some extra commands that can allow for some interactivity. Finally, the weather class takes care of randomizing the weather. 

It is important to to require both the `airport.rb` and `plane.rb` file for the program to run

Here is a short example of how a user can make a plane takeoff from an airport and land in another
```
3.0.2 :003 > airport = Airport.new
 => #<Airport:0x00007fa244266b80 @capacity=75, @planes=[], @weather=#<Weather:0x00007fa244266ab8>> 

3.0.2 :004 > plane = Plane.new(airport)
 => 
#<Plane:0x00007fa244264df8
... 

3.0.2 :005 > plane.takeoff(airport)
 => true 

3.0.2 :006 > airport.confirm_takeoff(plane)
 => "#<Plane:0x00007fa244264df8> has taken off"
 
 3.0.2 :007 > airport2 = Airport.new
 => #<Airport:0x00007fa2440b9350 @capacity=75, @planes=[], @weather=#<Weather:0x00007fa2440b8c20>> 

3.0.2 :008 > plane.land(airport2)
 => false 

3.0.2 :09 > airport2.confirm_landing(plane)
 => "#<Plane:0x00007fa244264df8> has landed" 
```

In order to randomize weather I used the `stormy?` which returns a 50/50 chance of the weather being stormy each time this command is called (whenever a plane attemps to takeoff or land at an airport). If the weather is stormy then planes will not be able to land or takeoff from the airport.