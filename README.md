# Airport Challenge

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

# Usage

The three classes in 'lib' can be imported and used as needed.

 Weather
---------

The weather class contains one static method 'generate':

    Weather.generate

this will return either 'sunny' or 'stormy'


Airport
---------

An airport will always be created empty.

An airport with the default capacity of 5 can be created with:

        airport = Airport.new

To define a custom capacity (eg. 10):

        airport = Airport.new 10

 To get the number of planes currently landed at airport:

        airport.count

 To see if the airport is full (number of landed planes is at capacity):

        airport.full?


 Aeroplane
---------

An aeroplane will always be created in the sky (eg not at an airport):

A plane can be created with:

        plane = Aeroplane.new

To attempt to land a plane, you must pass it an instance for the airport you wish to land it at:

(weather is generated randomly but can be overridden with keyword 'weather')

        plane.try_land airport

This will rely on the following conditions:
- the airport is not at capacity
- the weather is not stormy

To attempt to take off:

(weather is generated randomly but can be overridden with keyword 'weather')

        plane.try_take_off

This will rely on the following conditions:
- the plane is at an airport
- the weather is not stormy

To see if the plane is currently landed:

        plane.in_airport?

To get the airport the plane is currently at:
(will be nil if plane is in air)

        plane.airport

# Notes

The aeroplane uses callbacks to tell the airport when it lands or takes off.
(these are used by the aeroplane class and should not be called directly)

      on_land airport
      on_take_off

The airport and aeroplane classes are co-dependant,
however seeing as there is only one place for a plane to land,
i didn't see this as an issue.

It is the responsibility of the aeroplane to determine whether landing conditions are appropriate. The airport simply records the volume of landed planes and determines whether or not its at capacity.
