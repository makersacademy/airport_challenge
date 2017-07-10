# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full

require_relative '../lib/plane.rb'
require_relative '../lib/airport.rb'
require_relative '../lib/weather.rb'

weather = Weather.new(:sunny)
airport = Airport.new("London Heathrow", weather)
puts "Airport capacity is #{airport.capacity}"

# Land 5 planes, fail attempting to land 6th plane
planes = []
(airport.capacity + 1).times do |i|
  puts "Plane #{i + 1}:"
  plane = Plane.new
  puts plane.status

  begin
    plane.land(airport)
    puts plane.status
    planes << plane
  rescue => exception
    puts exception.inspect
  end
end

# Takeoff 2 planes
2.times do |i|
  puts "Plane #{i + 1}:"
  plane = planes.shift
  begin
    plane.takeoff(airport)
    puts plane.status
  rescue => exception
    puts exception.inspect
  end
end

# Land 2 more planes, fail attempting to land one more after that
3.times do |i|
  puts "Plane #{i + 6}:"
  plane = Plane.new
  puts plane.status

  begin
    plane.land(airport)
    puts plane.status
    planes << plane
  rescue => exception
    puts exception.inspect
  end
end
