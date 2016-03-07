require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

airport = Airport.new
plane = Plane.new

#airport accepts new plane
airport.accept(plane)

#airport departs plane
airport.depart(plane)

#throw error when plane isn't at airport
#airport.depart(plane)

#confirm whether plane is at airport
airport.present?(plane)

#airport cannot land planes once full
# planes = []
# 20.times { planes << Plane.new }
# planes.each do |plane|
#   airport.accept(plane)
# end
# airport.accept(plane)
