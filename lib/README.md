##Airport Challenge

#Description

This project creates a software that can be used for airports to manage the landing and taking-off of planes depending on airport capacity and weather. It also takes into account that new planes can be built and moved into airports by land.

#Workflow

The workflow establishes 3 classes: Airport, Plane and Weather. The first two provide the framework to allow planes from moving around in between airports whereas the last one has as it's only function to establish the weather.

In order to use our project we will need to create an airport which will start empty and with the default capacity of 20 planes (this can be adjusted by passing an argument when creating the airport instance).

```[4] pry(main)> heathrow=Airport.new
=> #<Airport:0x007fdbf3ac27f0 @capacity=20, @planes=[]>```
