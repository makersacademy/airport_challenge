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

puts "\Setup a plane to land at 'Airport001'"
airport001 = world.airports.select { |tmp_airport| tmp_airport.name == 'Airport001' }[0]
world.planes[0].destination = airport001
puts "destination set to Airport001"

puts "\nList of planes trying to land at 'Airport001'"
landing_planes = world.planes.select { |tmp_plane| tmp_plane.destination.is_a? Airport }
airport001_planes = landing_planes.select { |tmp_plane| tmp_plane.destination.name == 'Airport001' }

airport001_planes.each_with_index { |tmp_plane, index|
  print "#{tmp_plane.registration}, "
  print "\n" if (index + 1) % 4 == 0
}
print "\n"

selected_plane = airport001_planes[0]
puts "\ntrying to land plane in random weather at 'airport001'"

while airport001.weather != 'stormy'
  selected_plane.destination = airport001
  puts "\nrequest a plane to land at 'Airport001'"
  selected_plane.land
  puts airport001.weather
end

puts "\nIf all outputs are aligned with expectations - US5 feature tests passed"
