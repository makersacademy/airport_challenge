require_relative 'airport'

puts 'create a new airport'
puts airport = Airport.new

puts 'create a new plane'
puts plane1 = Plane.new

puts 'create a new plane'
puts plane2 = Plane.new

puts 'create weather report'
puts weather_report = WeatherReport.new

puts 'airport checks weather conditions before landing'
puts airport.safe_conditions?(weather_report.weather_conditions)

puts 'checks if it\'s clear for landing'
puts airport.clear?

puts 'land plane'
puts airport.land_plane(plane1)

puts 'land plane'
puts airport.land_plane(plane2)

puts 'airport checks weather conditions before departure'
puts airport.safe_conditions?(weather_report.weather_conditions)

puts 'checks if it\'s clear for departure'
puts airport.clear?

puts 'plane departs'
puts airport.plane_depart
