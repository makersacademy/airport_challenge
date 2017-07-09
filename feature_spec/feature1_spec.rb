# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport and confirm that it has landed

require_relative '../lib/plane.rb'
require_relative '../lib/airport.rb'
require_relative '../lib/weather.rb'

weather = Weather.new(:sunny)
airport = Airport.new("London Heathrow", weather)
plane = Plane.new
puts plane.status

2.times do
  begin
    puts "Attempting landing at #{airport.name}"
    plane.land(airport)
    puts plane.status
  rescue => exception
    puts exception.inspect
  end
end
