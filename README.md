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

#Approach and startegy to the task:
When starting this exercise the first thing I've done was read the script several times and create a diagram that helps me break down all of the problems into small steps:

Airport 

- responds to land - and takes in planes
- responds to take off - let's planes leave
- prevents take off when it it stormy
- prevents land when it is stormy
- can be ither full or empty and has a default capacity

Planes

- can take off
- can land

Weahter

- is a constant and is randomly selected but needs to be stormy sometimes 

This helped me create classes in my head and I then started creating tests to start making methods.
I first created all of the simple tests that check if subjects respond to methods
I then moved on to raising errors when airport is empty or full and when plane has already landed or it is already flying
The hardest part was to raise errors that araise when the weather is stromy as condtions can change
After I managed to create those conditions in raising of issues I've regrouped all of the tests into -take off and land behaviour




