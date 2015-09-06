Harry's Airport Challenge
=================

[![Build Status](https://travis-ci.org/makersacademy/airport_challenge.svg?branch=master)](https://travis-ci.org/makersacademy/airport_challenge)

For the first weekend challenge we were required to create an airport management system that would allow planes to take off and land. There are some further caveats that the below user stories have laid out.

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client.

```
As a pilot
So that I can arrive at my specified destination
I would like to land my plane at the appropriate airport

As a pilot
So that I can set off for my specified destination
I would like to be able to take off from the appropriate airport

As an air traffic controller
So that I can avoid collisions
I want to be able to prevent airplanes landing when the airport if full

As an air traffic controller
So that I can avoid accidents
I want to be able to prevent airplanes landing or taking off when the weather is stormy
```

**Planes**

I decided to first work on the plane class.

Added functionality of landing and take off.

**Airport**

Once i had planes i could land i looked at the airport class

Added the functionality to land and take off planes and that in turn to update the status of the planes flying?.

I then added the weather but felt that the airport class should not do this so i created a module for the weather.

**Weather**

I created the module Weather to random generate stormy conditions.
