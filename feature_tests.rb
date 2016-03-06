require './lib/airport'
require './lib/plane.rb'

airport = Airport.new
plane = Plane.new

#throw error when plane isn't at airport
#airport.depart(plane)

#land a plane
airport.accept(plane)

#confirm whether plane is at airport
airport.present?(plane)

#depart a plane
airport.depart(plane)

#confirm whether plane is at airport
airport.present?(plane)
