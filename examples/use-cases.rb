require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

# Creating a number of planes
plane1, plane2, plane3, plane4 = Array.new(4) { Plane.new }

# Creating two new airports
airport1, airport2 = Array.new(2) { Airport.new }

# Adding planes to the airports
[plane1, plane2].each { |p| p.new_to_landed airport1 }
[plane3, plane4].each { |p| p.new_to_landed airport2 }

# Instructing a few planes to take off
plane1.take_off airport1
plane3.take_off airport2

# Instructing planes in air to land
plane1.land airport2
plane3.land airport1

# Changing capacity of airport1
airport1.change_capacity 35
