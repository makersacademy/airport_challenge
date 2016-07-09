require_relative 'airport'

puts 'create a new airport'
puts airport = Airport.new

puts 'create a new plane'
puts plane = Plane.new

puts 'create weather report'
puts weather_report = Weather.new

#puts 'check the weather conditions'

puts 'land plane'
puts airport.land_plane(plane)

#puts 'plane confirms landing'
#puts plane.landed?
