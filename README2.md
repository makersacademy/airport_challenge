https://travis-ci.org/Triffanys101/airport_challenge.svg?branch=master

The aim of this program is to create a system where planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. Allow planes to take off and land at the appropriate airports. Following the user stories airports also need the ability to stop planes from landing when the airport is full and during stormy weather.

Currently the program has the ability for planes to take off from an airport and return the status flying as true. They can also land at an airport and return the status landed. A basic traffic control method has been implemented, which allows the plane to request whether they are egible to land based on how many planes are currently at the airport. Therefore the airport also has a capacity limiter.

A random weather, which chooses between Sunny and Stormy has been added through a module. The Traffic Control has also been put into a module and will raise various runtime errors for the right critera. I wouldn't say this is a completed program because although it (sometimes) passes all the tests i'm not sure it is working quite the way I would have liked. The connection between airport and the various modules appears tenuous and when running in irb it will occassionally return nil on random planes...

If I had more time I would have liked to create more tests, perhaps change how I've chosen to group the various methods etc. Generally make it more streamline and more solid as a piece of programming.
