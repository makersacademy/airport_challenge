require './lib/airport'
require './lib/plane'
require './lib/weather_station'

#Initialize objects
weather_station = WeatherStation.new
airport = Airport.new(weather_station)
plane = Plane.new


#Define varaibles
array_of_planes = Array.new(19) { Plane.new }

#Scenario_04
# airport.issue_landing_permission(plane)
# p airport.planes
# p plane.location
# airport.issue_take_off_permission(plane)
# p airport.planes
# p plane.location
# airport.issue_take_off_permission(plane)


#Scenario_03
# p weather_station.sunny?
# array_of_planes.each do |p|
# airport.issue_landing_permission(p)
# end

#Scenario_02
# airport.issue_landing_permission(plane)
# p airport.planes
# p plane.landed?
# puts
# airport.issue_take_off_permission(plane)
# p airport.planes.include?(plane)
# p plane.landed?

#Scenario_01
#Stake a landing and inspect the state of the objects
puts plane
airport.issue_landing_permission(plane)
puts "Current planes present in airport: #{airport.planes}"
puts "Plane landed status: #{plane.landed?}"