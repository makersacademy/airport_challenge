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

For this class I have decided to implement just two classes:
 Airport
 Plane

Every Airport is initialized with a default hangar capacity, that can be overridden passing an argument at initialization.

It responds to two public methods:
	#allow_landing:
	  it accepts a Plane object, checks for available space in the hangar, then for the weather.
	  If these checks pass, it stores the plane in the array, after changing the plane status from flying to landed.

	#allow_take_off:
	  checks if there are planes in the hangar, then checks for the weather.
	  If these checks pass, the last plane in the array takes off.

The only private method is the check for the weather: it has a 10% chance of stormy weather, and a 90% of good weather.


Every Plane object is initialized as flying, and its status is changed everytime it lands or it takes off.	     
