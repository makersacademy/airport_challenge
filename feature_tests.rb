require './lib/airport'
require './lib/plane.rb'
require './lib/weather.rb'

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

#WEATHER

Weather.new.stormy?

#prevent plane from taking off in stormy weather
