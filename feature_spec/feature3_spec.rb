# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy

require_relative '../lib/plane.rb'
require_relative '../lib/airport.rb'
require_relative '../lib/weather.rb'

2.times do |i|
  weather = Weather.new(i.zero? ? :stormy : :sunny)
  airport = Airport.new("London Heathrow", weather)
  plane = Plane.new(airport)

  puts plane.status
  begin
    plane.takeoff(airport)
    puts plane.status
  rescue => exception
    puts exception.inspect
  end
end
