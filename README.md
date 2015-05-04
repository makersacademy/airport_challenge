Airport Challenge
=================

The Challenge:
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
I want to be able to prevent airplanes landing when the weather is stormy
```

Your task is to test drive the creation a set of classes/modules to satisfy all the above user stories. You will need to use random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour. Finally, every plane must have a status indicating whether it's flying or landed.

Sudo-breakdown:
--------------
Looking at the user notes. I need to first draw a diagram so that I can map out all the feature tests, unit tests, and classes that will be needed for the following features to work properly. As a quick summary I need to create planes, have their status set to flying when in the air, have them request to land, the airport will then decide if they can land based on the availability of space in the airport(free) and the weather(good). If both fail then the plane cannot land. If the weather is good but the airport is full then they cannot land. If the airport has parking space but the weather is not good then the plane cannot land. Thus both features must be true. When the plan lands it's status must change to landed and the airport must reduce their space by one.This must then apply to when the plane wants to take off too.

How I plan to tackle the challenge:Steps:
-----
1.
