Airport Challenge
=================

## Process:

I created an Airport class, empty Plane class and a Weather module. I decided to keep Weather as a module instead of a class as I could then include the methods in my Airport class. If I were to have used Weather as a class I could have initialized the storminess every time Airport is instantiated. However with this approach I could not find a terse way of checking the stormy? method inside of the Airport class.

The error handling is based on checking the passed plane against the plane array within the airport and against max capacity, as well as checking for storminess.

An edge case still exists where if confirm_takeoff is called passing in a plane which has never been at the airport, it will report that it has taken off. Perhaps this is just a badly worded return string, or maybe there should be a "planes that took off" array to check against so the airport has a log of the coming and goings.

All tests are grouped by context.
The planes array is viewable from outside as some tests were built to rely on checking the size/if a plane is within the array, but this can be removed from the Airport class and will not result in any operational change.
