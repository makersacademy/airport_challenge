CATZKORN Air & Airports
=================

```
        ______
        _\____\___
=  = ==(_CATZKORN_)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

Welcome to the Airport!

We are so glad you have chosen to take your journey with Catzkorn Air and Airport Enterprises!

## How to Use 

### In IRB:

```
2.6.5 :001 > require "./lib/airport.rb"
```

### Creating your airports:

`airport = Airport.new`
```
2.6.5 :002 > gatwick = Airport.new
 => #<Airport:0x00007f9bb101cee0 @capacity=10, @planes=[]> 
2.6.5 :003 > heathrow = Airport.new
 => #<Airport:0x00007f9bb1036188 @capacity=10, @planes=[]> 
 2.6.5 :006 > luton = Airport.new(3)
 => #<Airport:0x00007f9bb1059070 @capacity=3, @planes=[]> 
```
Note: Airports have a default capacity of 10 unless an alternative parameter is provided.

### Create your planes:

`plane = Plane.new`

```
2.6.5 :004 > A380 = Plane.new
 => #<Plane:0x00007f9bb103e090 @current_airport=nil> 
2.6.5 :005 > Dreamliner = Plane.new
 => #<Plane:0x00007f9bb1053a58 @current_airport=nil> 
2.6.5 :007 > gulfstream = Plane.new
 => #<Plane:0x00007f9bb106bf68 @current_airport=nil> 
 ```

### Land your planes:

`plane.land(airport)`

```
2.6.5 :008 > A380.land(luton)
 => #<Airport:0x00007f9bb1059070 @capacity=3, @planes=[#<Plane:0x00007f9bb103e090 @current_airport=#<Airport:0x00007f9bb1059070 ...>>], @weather_states=["sunny", "sunny", "stormy"]> 
 2.6.5 :009 > gulfstream.land(heathrow)
 => #<Airport:0x00007f9bb1036188 @capacity=10, @planes=[#<Plane:0x00007f9bb106bf68 @current_airport=#<Airport:0x00007f9bb1036188 ...>>], @weather_states=["sunny", "sunny", "stormy"]> 
```

Planes are not able to land if there is no capacity at an airport, if they are already landed, or if the weather is stormy!

```
2.6.5 :010 > Dreamliner.land(gatwick)
 => #<Airport:0x00007f9bb101cee0 @capacity=10, @planes=[#<Plane:0x00007f9bb1053a58 @current_airport=#<Airport:0x00007f9bb101cee0 ...>>], @weather_states=["sunny", "sunny", "stormy"]> 
2.6.5 :011 > Dreamliner.land(gatwick)

RuntimeError (This plane is already landed)
```

### Take off:

`plane.take_off`

or from a specific airport

`airport.request_take_off(plane)`

```
2.6.5 :013 > Dreamliner.take_off
The plane has departed

2.6.5 :014 > gulfstream.take_off
RuntimeError (Weather is stormy, unsuitable for take off)
```

Planes can not take off if they are already flying, if they are not located at the specific airport you are requesting take off from or if the weather is stormy!



## Thank you once again for using and flying with Catzkorn Air & Airports!
