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

What this program does
---------
This program creates 3 classes and their respective examples
  * Airport
  * Plane
  * Weather

Airport
--------

#### **initializes** with an empty airpot array and a default capacity
#### **landing method** that takes a plane argument
  * It denies access to airport if it is stormy, full, or the plane is at another airport
  * It triggers the plane class *status method* to read true meaning the plane is grounded
  * It add the plane class to the airport array
#### **takeoff method** that takes a plane argument
  * It denies take off if stormy, or the plane was never at the airport
  * it deletes the plane from the airport array
  * returns the plane
#### **additional methods**
  * *number_grounded* returns length of airport array
  * *empty?* tests is the airport has no planes
  * *stormy?* takes a weather argument and returns true/false depending on the weather
  * *grounded?* take a plane argument passed to the land method to see if the planes switchs has been triggered meaning that it is at another place
  * *flying?* takes a plane argument passed from the take off method to see if the plane requested is actually in the air
  * *full?* private method that checks if the airport is at capacity




Plane
_________

#### A simple class that has a status trigger that returns true/false





Weather
________

#### A simple class that creats a random weather condition and returns if it is stormy or not
