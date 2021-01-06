Airport App
=================
This is a Ruby command line application used for plane arrival and departures at different airports.
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

## Set up  

1) Clone this repository
2) In your terminal, run:
```
$ bundle
```

## Instructions for use  

1) Open irb  
```
$ irb
```
2) Require necessary files  
```
> require './lib/weather.rb'
> require './lib/plane.rb'
> require '/lib/airport.rb'
```
3) Begin app use...
- Create a new airport, specifying the capacity as the argument:
```
> gatwick = Airport.new(40)
```
- Create a plane:
```
> plane = Plane.new
```
- To land the plane:
```
> gatwick.land(plane)
```
- To takeoff the plane:
```
> gatwick.takeoff(plane)
```
- You can create different airports, land and takeoff different planes. The app will throw errors if the weather is stormy, if that plane is already landed or if the airport if full.
  
## User Stories  

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