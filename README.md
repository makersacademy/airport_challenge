Airport Challenge
=================

This program allows a traffic controller to manage the flow of planes at an airport.

```
        ______
        _\____\___
=  = ==(____KD____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                      (_________)
                      (_______)
             =========(_____)
                      (___)
                      (__)
                      (_)

```


How to Use
---------

```
irb -r "./lib/airport.rb"
```
* Create an airport:

```
heathrow = Airport.new
```

* Create some planes:

```
ba55 = Plane.new
su420 = Plane.new
```

* Land the planes or instruct them to take off:

```
heathrow.land(ba55)
heathrow.takeoff(ba55)
```

* There is a 10% chance of the weather being stormy! The program disallows the controller to land or takeoff planes during a storm.
* The program also disallows the controller to land a plane in a full airport, or takeoff planes when there are none.
