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

Airport Challenge approach
---------

Initially I decided to put land and takeoff in the Plane class as planes are taking the order from air control - could have gone in Airport class but I wasn't too sure.

For user story 2 I created some instance variables for Airport and Plane:
Name  to identify planes/airports
 Hangar to store Plane objects
Location to store Airport objects.

US 3 & 4:
Created capacity of airports with default value 1.
Created guard condition for land method.
Found that implementation for US3 already satisfied US4 test.

US 5 & 6:
Created stormy? method and created tests which predetermined weather conditions and tested methods.

Possible things I could have changed:
Unsure about which methods belong in Plane and Airport
Could have made a weather class which is in charge of deciding weather.
Created a proper feature test - or refactored tests to remove redundant tests
