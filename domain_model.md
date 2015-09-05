## User Stories and Domain Model

Taking these user stories as a starting point:

````
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
````

This is my Domain Model:

| Objects            | Messages         |
| :---------------:  | :-------------- :|
| Pilot              |                  |
| Traffic Controller | allow landing    |
| Plane              | flying/landed    |
| Airport            | capacity         |
| Airport            |  take_off        |
| Airport            |  land            |
