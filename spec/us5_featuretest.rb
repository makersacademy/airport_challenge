require './lib/software_airport'
require './lib/class_world'

=begin
User story 5/6 -
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
=end

# create envirionment for test: airport, plane, etc
puts "create operational environment - 'world'"
world = World.new
world.default
raise StandardError "World scenario not created correctly" if world.scenario_setup?

puts "\nworld contains - #{world.planes.count} planes - default names used"
puts Plane.list_all_planes.inspect
puts "\nworld contains - #{world.airports.count} airports - default registrations used"
puts Airport.list_all_airports.inspect

puts "\nAdd a plane to 'Airport001'"
airport001 = world.airports.select { |tmp_airport| tmp_airport.name == 'Airport001' }[0]
world.planes[0].location = airport001
puts world.planes[0].location.name == "Airport001"

puts "\nList of planes at 'Airport001'"
airport_planes = world.planes.select { |tmp_plane| tmp_plane.location.is_a? Airport }
airport001_planes = airport_planes.select { |tmp_plane| tmp_plane.location.name == 'Airport001' }

airport001_planes.each_with_index { |tmp_plane, index|
  print "#{tmp_plane.registration}, "
  print "\n" if (index + 1) % 4 == 0
}
print "\n"

selected_plane = airport001_planes[0]
selected_plane.destination = world.airports[1]
puts "\ntrying to take off until weather is 'stormy' at 'airport001'"

while airport001.weather != 'stormy'
  selected_plane.location = airport001
  puts "\nrequest a plane at 'Airport001' to take off"
  selected_plane.take_off
  puts airport001.weather
end

puts "\nIf all outputs are aligned with expectations - US5 feature tests passed"
