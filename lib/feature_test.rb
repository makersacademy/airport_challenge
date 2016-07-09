require_relative 'airport'

puts 'create a new airport'
puts airport = Airport.new

puts 'create a new plane'
puts plane = Plane.new

puts 'create weather report'
puts weather_report = WeatherReport.new

puts 'check the weather conditions'
5.times {puts weather_report.weather_conditions }

puts 'weather gauge, scale 1-5, 5 is a storm'
5.times {puts weather_report.weather_gauge}

puts 'land plane'
puts airport.land_plane(plane)

#puts 'plane confirms landing'
#puts plane.landed?
