=begin
# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

require_relative '../lib/plane.rb'
require_relative '../lib/airport.rb'

airport = Airport.new("London Heathrow")
plane = Plane.new(airport)

puts plane.status
plane.takeoff(airport)
puts plane.status

begin
  plane.takeoff(airport)
rescue => exception
  puts exception.inspect
end

airport2 = Airport.new("London Gatwick")
plane.land(airport2)
puts plane.status

begin
  plane.takeoff(airport)
rescue => exception
  puts exception.inspect
end
=end
