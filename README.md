Roxu's Airport
==============

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

This is a software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  

Airport class
- will give an instance of itself with a default capacity of 50 planes ( you can change that if you input your desired capacity as an argument), and an instance of the Weather class as the second default argument.
- can land planes (instance of the Plane class) if the airport is not full and the weather is not stormy)
- can tell planes to take off (if the planes are in the airport //the test is yet to pass// and the weather is not stormy)

Plane class
- gives an instance of itself to use in Airport class

Weather class
- contains a method to check if the weather is stormy by choosing a random value from a given array which is used to decide if the planes are allowed to land/take off
