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

# Catch and output the error
begin
  11.times {
    puts "Landing a plane..."
    Plane.new.land(gatwick)
    check_number_of_planes(gatwick)
    puts ""
  }
rescue StandardError => error
  puts error
end

puts ""
puts "A plane is leaving..."
plane = gatwick.planes[0]
plane.take_off(gatwick)
check_number_of_planes(gatwick)

puts ""
puts "Asking a plane by mistake to take off again..."

begin
  plane.take_off(gatwick)
rescue StandardError => error
  puts error
end
