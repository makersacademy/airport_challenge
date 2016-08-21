Airport Challenge
=================
[![Build Status](https://travis-ci.org/jamesstonehill/airport_challenge.svg?branch=master)](https://travis-ci.org/jamesstonehill/airport_challenge)

```
        ______
        _\____\___
=  = ==(____JS____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

This project is James Stonehill's solution to the Makers Academy Airport Challenge.

## **Overview**

The bulk of the logic is centred around the plane object. It seemed to me that it was logically easier for a user to understand if the plane, as an autonomous and atomistic unit, was the main object that you dealt with. One option would have been to allow the airport to manage the taking off of planes, but I decided that plane.take_off(weather) was better than airport.release_plane(plane, weather).

### **Planes**

Initialising a Plane: When a plane is created it's location is set to `nil` and it is not contained in any of the airport objects. This is the same for when the plane is in the air also. In order to start a plane at a specific airport, you should use the `plane.install_at(airport)` method. This method allows you to put a plane object into an airport without taking the weather into account as long as the airport has available space. This method should only be used once, as after a plane has been installed at an airport, it will tend to fly everywhere. 

#### Landing A Plane:
In order to land a plane you need to apply the method land_at to a Plane object and provide the method two arguments
1. An instance of the Airport object.
2. An instance of the Weather object.

so your code might look like this:
`boing_747.land_at(LHR, current_weather)`

If the current weather is not stormy, then you will successfully take off.

#### Taking Off A Plane:
In order for a plane to take off, all you need to do is provide a plane object (that is currently in an airport) a weather argument. Like so:
`boing_747.take_off(current_weather)`

If the current weather is not stormy, then you will successfully take off.


### **Weather**

Initialising a new weather system:
Every time you create a new weather system, `current_weather = Weather.new` the system has a 1 in 10 chance of being stormy. Once a weather system is created, it can not be changed, so to simulate the passing of time, you will need to continually create new weather systems. The weather class is intended to be a snapshot in time. So a good use of it would be to name each weather instance by a date. For example `oct_31_2016 = Weather.new` and for each day you would then create a new instance of Weather.

### **Airports**

Airports are a pretty basic Class. They mostly funcition as a storage box for plane objects. They keep track of how much free space they have.

To create a new airport all you need to do is initialize it. e.x.: `jfk = Airport.new`.

If you wish to set the capacity of the aiport (how many planes it can hold) you can do so by adding an argument to the initialize method. E.x.: `lhr = Airport.new(85)` would mean that 'lhr' airport has room for 85 planes.
