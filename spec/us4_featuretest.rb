require './lib/software_airport'
require './lib/class_world'
=begin
User story 4 -
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
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

puts "\nchange the capacity of selected airport to '20' - 'Airport001'"
puts "Original - #{Airport.list_all_airports[0].capacity}"
Airport.list_all_airports[0].capacity = 20
puts "Updated - #{Airport.list_all_airports[0].capacity}"

puts "\nairport listing capability"
world.airports.each_with_index { |airport, index|
  print "#{airport.name} - #{airport.capacity}   "
  print "\n" if (index + 1) % 4 == 0
}
print "\n"

puts "\nIf all outputs are aligned with expectations - US4 feature tests passed"
