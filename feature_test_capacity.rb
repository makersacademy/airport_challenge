require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

# Creating fake Weather class that always gives sunny weather
# so that the feature test is consistent
class WeatherAlwaysSunny
  def sunny?
    true
  end
end

weather = WeatherAlwaysSunny.new

gatwick = Airport.new(weather)

def check_number_of_planes(airport)
  puts "Number of planes in airport: #{airport.planes.count}"
end

check_number_of_planes(gatwick)

plane_one = Plane.new
plane_one.land(gatwick)

check_number_of_planes(gatwick)

plane_two = Plane.new
plane_two.land(gatwick)

check_number_of_planes(gatwick)

puts "land many planes (fail on 11th plane due to capacity)..."

# Catch and output the error
begin
  9.times {
    puts "Landed? #{Plane.new.land(gatwick)}"
  }
rescue StandardError => error
  check_number_of_planes(gatwick)
  puts error
end
