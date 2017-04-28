Airports
========

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

````````````"""""""""""""""""""""================!=============!==============!

Airports is a program that manages airpots.

* It manages planes landing and taking off.
* It will not allow more planes to land than capacity of the airport.
* Capacity is defaulted to 10 but can be assigned when the airport instance is created.
* It currently creates a new Plane instance as default when landing a plane but an existing one can be assigned if desired.
* A new Plane instance does not have any attributes at present as not requested
* In lieu of an input for weather status it currently has a random generator giving a 20% chance that weather is stormy.
* Weather status can also be accessed outside of the instance so that weather status can be correctly assigned when an input for weather status becomes available.
* It will not allow planes to land or take off if weather is stormy.

Instructions
---------
A new airport can be created by creating a new Airport class - Airport.new.

Capacity can be optionally assigned by passing an argument on Airport creation - example of creating an airport with capacity of 35 - 'Airport.new 35'

Assessing the planes at the airport is through the 'planes' variable that can be accessed outside of the class instance

Landing a plane is done through calling the 'land_plane' method within the instance. It will default to creating a new Plane instance to remember the plane but an existing one can be passed as an argument if desired.

Making a plane take off is done through calling the 'plane_take_off' method. At present it will simply make the last plane to land to take off. This could be easily changed to choose which plane but was not specifically requested nor practical until Planes have attributes to define a desired sequence of take off. Or more simply a desired take off time based on a time table.

Weather is currently randomly assigned on creation of airport however can be accessed, and changed, through the weather variable. Presently the options are '1' for weather is good and '0' for weather is stormy.

An example feature test would therefore be:

airport_test = Airport.new 3 # creates new airport with capacity of 3
airport_test.weather = 1 # sets weather to good.
airport_test.land_plane # Lands a plane. Will through an error if weather is stormy
airport_test.land_plane(existing_plane) # Lands an existing plane
2.times { airport_test.land_plane } # will throw an argument as capacity is full at 3
airport_test.weather = 0 # sets weather to stormy.
airport_test.plane_take_off # will throw an argument error as weather is stormy


RSPEC Tests
-----

Each scenario has a unit test against it and can be found in the airport_spec.rb file in the rpsec folder. This includes a test to completely fill the airport and then make all planes takeoff with a failure when more planes try to take off than there actually are. 
