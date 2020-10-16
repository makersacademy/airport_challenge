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
I read the user stories and realised I'd need to have the airport and the plane as 2 separate objects.

After that I listed the methods these classes would require.

Then I made sure I took the TTD approach where I wrote a test then coded to pass it.

When I got to determining the weather, to make sue the Airport class was independent, I created a separate class for it.
Since, it only had to be stormy occasionally, I generated a random number between 1 and 5, and its declared stormy if the outcome of that is a 1. (this way the probability of it stormy is 1/5 and it being sunny is 4/5).

I also ended up making a couple private methods again to make the main ones shorter and more independent.

Here's my tests (all pass) :

```bash
Airport
  #initialize
    sets a default capacity for the airport
  #landing
    lands a plane into the airport
    does not allow landing if hanger full
    does not allow landing if stormy
    does not allow landing if plane already landed
  #takeoff
    plane takes off out the airport and confirms its out
    does not allow takeoff if stormy
    does not allow takeoff if plane already taken off
  #feature test
    Allows a number of planes to land and take off

Weather
  #stormy
    returns true if weather is randomly set to stormy
    returns false if weather is not randomly set to stormy
```
