# Esther - Airport Challenge

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

## How to Use

- Airport objects are initialized with a default capacity of 10.
- To use all methods are called on Plane objects.
- Landing / take off is subject to conditions.
- Can call an airport to check capacity and planes landed.
- Start by opening the 'plane.rb' file

Here is an example of what you could write in irb:
```
gatwick = Airport.new
heathrow = Airport.new(5)

plane1 = Plane.new
plane2 = Plane.new
plane3 = Plane.new

plane1.land(gatwick)
plane2.land(heathrow)
plane3.land(gatwick)

gatwick

plane1.take_off(gatwick)

gatwick

```
