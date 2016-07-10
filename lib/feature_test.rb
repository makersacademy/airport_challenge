require_relative 'airport'

puts 'create a new airport'
puts airport = Airport.new

puts 'create a new plane'
puts plane = Plane.new

puts 'create weather report'
puts weather_report = WeatherReport.new

#puts 'weather gauge, scale 1-5, 5 is a storm'
#5.times {puts weather_report.weather_gauge}

puts 'create weather conditions from weather report'
10.times {puts weather_report.weather_conditions }

puts 'airport checks weather conditions before landing'
puts airport.safe_conditions?(weather_report.weather_conditions)

puts 'checks if it\'s clear for landing'
puts airport.clear?

puts 'land plane'
puts airport.land_plane(plane)

puts 'airport checks weather conditions before departure'
puts airport.safe_conditions?(weather_report.weather_conditions)

puts 'plane departs'
puts airport.plane_depart
