require_relative 'airport'

puts 'create a new airport'
puts airport = Airport.new

puts 'create a new plane'
puts plane = Plane.new

puts 'create weather report'
puts weather_report = WeatherReport.new

#puts 'weather gauge, scale 1-5, 5 is a storm'
#5.times {puts weather_report.weather_gauge}

puts 'check the weather conditions'
10.times {puts weather_report.weather_conditions }

puts 'plane checks if it \'s safe to land.'
puts plane.safe_to_land?(weather_report.weather_conditions)

#puts 'plane confirms landing'
#puts plane.landed?(weather_report.weather_conditions)

#puts 'land plane'
#puts airport.land_plane(plane)
