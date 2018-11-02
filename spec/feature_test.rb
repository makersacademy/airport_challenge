require './lib/plane.rb'
require './lib/airport.rb'
require './lib/weather.rb'

#make instances of the classes for use in the feature tests
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
class Always_sunny
  def report
    return "good"
  end
end

good_weather_airport = Airport.new(20, Always_sunny.new)
plane2 = Plane.new
plane2.land(good_weather_airport)
plane2.fly
puts "is the plane still in the airport? #{good_weather_airport.landed_planes.include?(plane2)} (should equal false)"
puts "landed in should be null. Does it? = #{plane2.landed_in == nil ? "yes" : "no"}"
puts "flying = true? #{plane2.flying}"


puts "----------------------------------------------------------"
puts "Testing that a plane cannot take off in bad weather (force bad weather)"
puts "----------------------------------------------------------"
class Always_stormy
  def report
    return "stormy"
  end
end

plane3 = Plane.new
plane_array = []
plane_array.push(plane3)
bad_weather_airport = Airport.new(20, Always_stormy.new, plane_array)
puts bad_weather_airport.release_plane(plane3) == false ? "test passed" : "Test failed"


#
# p "Does weather.report return stormy or good?"
# Weather.new.report
#
#
# puts "feature test starting"
#
#
# p airport.landed_planes
# puts "hello"
# puts airport.capacity
#
#
# puts "should be able to land a plane"
#
# plane.land(airport)
#
# puts "plane should be able to fly"
#
# plane.fly
