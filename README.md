#Airport Challenge
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

## Fred Halliwell
---------

This airport challenge allows the user to create a plane class, land it in an airport class, and take off.

The plane won't take off if the weather is stormy, which has a 10% chance of occuring via the random_weather method.

Enjoy having a snoop around :)
---------


### Land a plane

Create a new airport object with

```
airport = Airport.new
```

Create a new plane object with

```
plane = Plane.new
```

By default your plane starts not-landed. Land it with

```
airport.land(plane)
```

Your plane is now landed at the airport, and will be stored in the landed_planes array belonging to the airport class.



## Take off

You must first have a plane landed at the airport. If you don't, please follow 'Land a Plane'.

To take off, it's a simple as calling

```
airport.take_off(plane)
```

this will remove your plane from the landed_planes array and it will no longer be at the airport.



## Check for planes at the airport

You can check if a specific plane is at the airport by using 

```
at_airport?(plane)
```

the argument will be whichever plane object you are trying to check for. The method will return true if the plane is at the airport, but false if not.



# Thank you for reading, enjoy :)
