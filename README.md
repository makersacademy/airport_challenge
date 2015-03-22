Airport Challenge
=================

Thinking
---------


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

I really struggled with how to set up the tests. I started over twice.
I eventually decided that the top level features were very simple
and have deviated very far from the original prompts.

My grande finale feature tests are just that:
Pilots want to be able to take off and land.
Airports want to be able to approve each take off and landing.

Then, inside the unit tests are the checks on status, capacity and weather.

