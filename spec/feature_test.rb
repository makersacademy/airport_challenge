require_relative '../lib/plane.rb'
require_relative '../lib/weather.rb'
require_relative '../lib/airport.rb'

def one_airport_one_plane
  airport1 = Airport.new
  plane1 = Plane.new

  puts "The airport hanger: #{airport1.hanger.inspect}"
  puts "Is plane at airport: #{plane1.at_airport}"
  puts "Request plane to take off - should not be allowed to"
  airport1.take_off(plane1)

  puts "The airport hanger: #{airport1.hanger.inspect}"
  puts "Is plane at airport: #{plane1.at_airport}"
  puts "Request plane to land"
  airport1.land(plane1)

  puts "The airport hanger: #{airport1.hanger.inspect}"
  puts "Is plane at airport: #{plane1.at_airport}"

  puts "Request plane to take off"
  airport1.take_off(plane1)
  puts "The airport hanger: #{airport1.hanger.inspect}"
  puts "Is plane at airport: #{plane1.at_airport}"
  end

def one_airport_three_planes
  airport1 = Airport.new
  plane1 = Plane.new
  plane2 = Plane.new
  plane3 = Plane.new
  puts "The airport hanger: #{airport1.hanger.inspect}"
  puts "Request all planes to land"
  airport1.land(plane1)
  airport1.land(plane2)
  airport1.land(plane3)
  puts "The airport hanger: #{airport1.hanger.inspect}"
  puts "Request plane 2 to take off"
  airport1.take_off(plane2)
  puts "The airport hanger: #{airport1.hanger.inspect}"
  puts "Request plane 2 to take off - should fail (if it took off previously"
  airport1.take_off(plane2)
  puts "The airport hanger: #{airport1.hanger.inspect}"
end

def two_airports_one_plane
  airport1 = Airport.new
  airport2 = Airport.new
  plane1 = Plane.new
  puts "The airport1 hanger: #{airport1.hanger.inspect}"
  puts "The airport2 hanger: #{airport2.hanger.inspect}"

  puts "Request plane to land at airport 1 "
  airport1.land(plane1)
  puts "The airport1 hanger: #{airport1.hanger.inspect}"
  puts "The airport2 hanger: #{airport2.hanger.inspect}"

  puts "Request plane 1 to take off from airport 2 - this should fail"
  airport2.take_off(plane1)

  puts "Request plane 1 to land at airport 2 - this should fail"
  airport2.land(plane1)

  puts "The airport1 hanger: #{airport1.hanger.inspect}"
  puts "The airport2 hanger: #{airport2.hanger.inspect}"

  puts "Request plane to take off from airport 1"
  airport1.take_off(plane1)  

  puts "The airport1 hanger: #{airport1.hanger.inspect}"
  puts "The airport2 hanger: #{airport2.hanger.inspect}"

end

def one_tiny_airport_two_planes
  airport1 = Airport.new(1)
  plane1 = Plane.new
  plane2 = Plane.new
  puts "The airport hanger: #{airport1.hanger.inspect}"
  puts "Request all planes to land - could fail as airport has capacity for one plane"
  airport1.land(plane1)
  airport1.land(plane2)
  puts "The airport hanger: #{airport1.hanger.inspect}"
end

puts "****You may need to run file multiple times due to random weather****"
puts "---------------Scenarion 1: 1 airport and 1 plane--------------------"
one_airport_one_plane
puts "---------------Scenarion 2: 1 airport and 3 planes--------------------"
one_airport_three_planes
puts "---------------Scenarion 3: 2 airports and 1 plane--------------------"
two_airports_one_plane
puts "---------------Scenarion 4: 1 tiny airport and 2 planes--------------------"
one_tiny_airport_two_planes
