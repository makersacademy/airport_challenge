=begin
# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport and confirm that it has landed

require_relative '../lib/plane.rb'
require_relative '../lib/airport.rb'

plane = Plane.new
airport = Airport.new("London Heathrow")


puts plane.status
plane.land(airport)
puts plane.status

begin
  plane.land(airport)
rescue => exception
  puts exception.inspect
end

=end
