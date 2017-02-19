require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'
weather = Weather.new
airport = Airport.new(weather)

def check_number_of_planes(airport)
  puts "Number of planes in airport: #{airport.planes.count}"
end


check_number_of_planes(airport)

plane_one = Plane.new
puts "Land plane one at airport: #{plane_one.land(airport)}"
plane_one.land(airport)

check_number_of_planes(airport)


plane_two = Plane.new

puts "Land plane two at airport: #{plane_two.land(airport)}"
plane_two.land(airport)

check_number_of_planes(airport)


puts "land many planes..."
20.times {
  puts "Landed? #{Plane.new.land(airport)}"
}

check_number_of_planes(airport)
