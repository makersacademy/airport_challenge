require './lib/plane.rb'
require './lib/airport.rb'
require './lib/weather.rb'

# make instances of the classes for use in the feature tests
plane = Plane.new
airport = Airport.new

puts "----------------------------------------------------------"
puts "Testing that a plane can land in the airport"
puts "----------------------------------------------------------"
plane.land(airport)
puts "Does the airport contain the plan that landed? #{airport.landed_planes.include?(plane)}"
puts "Plane.flying should equal false when plane has landed. What does plane.flying equal? #{plane.flying}"

puts "----------------------------------------------------------"
puts "Testing that a plane can take off from airport (force good weather)"
puts "----------------------------------------------------------"
class AlwaysSunny
  def report
    return "good"
  end
end

good_weather_airport = Airport.new(20, AlwaysSunny.new)
plane2 = Plane.new
plane2.land(good_weather_airport)
plane2.fly
puts "is the plane still in the airport?
      #{good_weather_airport.landed_planes.include?(plane2)}
      (should equal false)"
puts "landed in should be null. Does it? =
      #{plane2.landed_in.nil? ? "yes" : "no"}"
puts "flying = true? #{plane2.flying}"

puts "----------------------------------------------------------"
puts "Testing that a plane cannot take off in bad weather (force bad weather)"
puts "----------------------------------------------------------"
class AlwaysStormy
  def report
    return "stormy"
  end
end

plane3 = Plane.new
plane_array = []
plane_array.push(plane3)
bad_weather_airport = Airport.new(20, AlwaysStormy.new, plane_array)
puts bad_weather_airport.release_plane(plane3) == false ? "test passed" : "Test failed"

puts "----------------------------------------------------------"
puts "US4: Testing that a plane cannot land in bad weather (force bad weather)"
puts "----------------------------------------------------------"

bad_weather_airport = Airport.new(20, AlwaysStormy.new)

plane4 = Plane.new
puts plane4.land(bad_weather_airport)
puts "----------------------------------------------------------"
puts "US5: Can't land in full airport"
puts "----------------------------------------------------------"

full_airport = Airport.new(0, AlwaysSunny.new)
plane5 = Plane.new

puts plane5.land(full_airport)

puts "----------------------------------------------------------"
puts "US6: Can't land in full airport"
puts "----------------------------------------------------------"

airport_default_capacity = Airport.new
puts airport_default_capacity.capacity == 20 ? "Default capacity works" : "Default capacity doens't work"
airport_capacity_10 = Airport.new(10)
puts airport_capacity_10.capacity == 10 ? "changing capacity works" : "changing capacity doesn't work"
