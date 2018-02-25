Airport Challenge
Makers Academy Week 1, Weekend Assignment
BY IRFAN DURRANI
=========================================

```
        ______
        _\____\___
=  = ==(____ID____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o I R F A N o o o o o o o o  |\_
          \     o o D U R R A N I o o o o o o o o   \
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```
All methods and tests has comments
### How to feature test in irb ###
```
require './lib/airport'

# --------------------------------------------------- #

# create an airport
# airport capacity is optional, default is set to 30
airport = Airport.new(airport_id, <capcity>)

# --------------------------------------------------- #

# to create a plane
# airport_id is optional (will be nil if not provided)
# plane = Plane.new(plane_id, <airport_id>)

# --------------------------------------------------- #

# create weather object
# weather = Weather.new
# weather are randomly 1/5 chances of it being stormy

# --------------------------------------------------- #
```
### Airport class methods
```
Airport.land(plane, weather)
# allows planes to land
# land() will throw error if
# - Plane has already landed at an(y) airport
# - Weather is stormy (can be overriden by passing false instead of weather)
# - Airport capacity is reached and there is no more space
```
```
Airport.take_off(plane, weather)
# allows planes to take_off if Weather_obj.stormy is false
# take_off() will throw error if
# - Plane not at the airport (in mid air or at any other airport)
# - Weather is stormy (can be overriden by passing false instead of weather)
```
```
Airport.full?()
# private method full() returns true or false depending on number of planes in the hanger
```

### Plane class methods
```
# No public methods. Just initialize() method that takes arguments as above
```
# Weather class methods
```
Weather.stormy?()
# stormy?(). This method returns true or false randomly 1/5 chances of storm
```
