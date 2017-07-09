# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport
# and confirm that it is no longer in the airport

require_relative '../lib/plane.rb'
require_relative '../lib/airport.rb'
require_relative '../lib/weather.rb'

weather = Weather.new(:sunny)
plane = Plane.new()
puts plane.status

3.times do |i|
  airport_name = i == 1 ? "London Gatwick" : "London Heathrow"
  airport = Airport.new(airport_name, weather)

  begin
    puts "Attempting takeoff from #{airport.name}"
    plane.takeoff(airport)
    puts plane.status
  rescue => exception
    puts exception.inspect
  end

  begin
    puts "Attempting landing at #{airport.name}"
    plane.land(airport)
    puts plane.status
  rescue => exception
    puts exception.inspect
  end

  puts ""
end
