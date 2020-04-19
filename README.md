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

Instructions
---------

This program is predominantly used by calling methods on objects of the 'Plane' class. An example of how to use the code is shown below:

In irb from the main folder:

```
require './lib/plane'
boeing = Plane.new("boeing")
jfk = Airport.new("jfk")
boeing.land("jfk")
jfk.list_of_planes
concord = Plane.new("concord")
concord.land("jfk")
jfk.list_of_planes
boeing.take_off(jfk)

```

A few things to note:
* If you instruct a plane to take off or land there is a 1 in 5 chance it won't be able to due to bad weather (and will throw an error message).
* If you instruct a plane to land it may not be able to if the airport has reached its capacity.
* You can change both the existing planes in the airport and the capacity of the airport respectively when initialising the Airport class, e.g. `luton = Airport.new("luton", ["boeing", "concord", "airbus"], 20)`
