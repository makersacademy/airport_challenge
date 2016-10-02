Airport Challenge
=================

## Description
This programme performs the function of monitoring aeroplane traffic at an airport.

The programme consists of 3 classes (Airport, Plane and Weather)

The programme methods exist within the cited class, with a description of the method provided.

The aim is to allow the Airport have planes land and take off, based on random weather conditions.

## Airport

* initialize - activates the following properties of the class
    @planes = an array holding the planes currently in the airport
    @weather = Provides a random weather forecast to the airport
    @capacity = Maximum number of planes which can be in the airport.
                Has a default capacity, but can be overridden by Airport initialisation.

* land(plane) - lands a plane and stores it at the Airport
    Will fail if the weather is stormy or the airport is full

* take_off(plane) - instructs a plane to take off from the Airport
    Will fail is the weather is stormy. Removes planes from the planes property

* planes - calls the planes

* full? - a private method for counting the number of planes in the airport

## Planes

* landed? - Checks if a plane has successfully landed, measures true

## Weather

* initialize - activates the property of the class
  @stormy = Holds the randomly selected forecast

* forecast - Provides a random weather forecast of stormy or not stormy
