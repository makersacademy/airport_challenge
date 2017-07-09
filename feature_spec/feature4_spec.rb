# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy

require_relative '../lib/plane.rb'
require_relative '../lib/airport.rb'
require_relative '../lib/weather.rb'

plane = Plane.new

2.times do |i|
  weather = Weather.new(i.zero? ? :stormy : :sunny)
  airport = Airport.new("London Heathrow", weather)

  puts plane.status
  begin
    plane.land(airport)
    puts plane.status
  rescue => exception
    puts exception.inspect
  end
end
