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

User Story 1
---------

* Design:
Object   | Messages
plane    |  land(airport)
airport  |  

**Notes:**
* I decided to give the "Plane" class a method "land" which will do something in the future, given an "airport".


User Story 2
---------

* Design:
Object   | Messages
plane    |   land(airport), takeoff, in_airport?(airport)
airport  |  

**Notes:**
* I've added three methods to the Plane class: "initialize", which sets an instance variable as nil, that will indicate if the plane is inside the airport or not through the "in_airport?" method. Now, both "land" and "takeoff" are able to change the status of the plane. 
