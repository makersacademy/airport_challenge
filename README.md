Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____KG____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

Instructions
---------
* This in an IRB application that allows users to simulate an air traffic controller, instructing planes when to land
and take off.

Quick Start
-------
1. Launch application into irb:
```
irb -r ./lib/airport.rb
```

2. Create an airport:
```
heathrow = Airport.new(100)
```
This creates an airport with a capacity of 100 planes. If no capacity is set the default
capacity of the airport will be 10.

3. Create some planes:
```
boeing_747 = Plane.new
airbus_A380 = Plane.new
```

4. Instruct the planes to land in your airport
```
heathrow.land(boeing_747)
heathrow.land(airbus_A340)
```

5. Instruct the planes to takeoff
```
heathrow.take_off(boeing_747)
heathrow.take_off(airbus_A340)
```

At times the weather will be stormy. During these conditions no planes will be able
to land or take off from the airport.
