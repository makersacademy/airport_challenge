require_relative '../lib/airport'
require_relative '../lib/plane'

    # FEATURE TESTS!

puts "Creating an airport..."

airport_one = Airport.new

puts "New Airport Created:\n\n#{airport_one}\n\n"

puts "There are #{airport_one.planes_in_hangar.length} planes in the hangar."

    # As an air traffic controller
    # So I can get passengers to a destination
    # I want to instruct a plane to land at an airport and confirm that it has landed

puts "Contacting a plane..."

plane_one = Plane.new

puts "Contact with Plane: #{plane_one}"

puts "Going to ask them to land..."

airport_one.land(plane_one)

puts "There are #{airport_one.planes_in_hangar.length} planes in the hangar now."

    # As an air traffic controller
    # So I can get passengers on the way to their destination
    # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

# puts "Asking plane to takeoff"
#
# airport_one.takeoff
#
# puts "There are #{airport_one.planes_in_hangar.length} planes in the hangar now."

    # As an air traffic controller
    # To ensure safety
    # I want to prevent takeoff when weather is stormy

# puts "Asking plane to takeoff"
#
# airport_one.takeoff
#
# puts "Hmm... it took off because the weather was good."

    # As an air traffic controller
    # To ensure safety
    # I want to prevent landing when weather is stormy

# puts "Contacting another plane..."
#
# plane_two = Plane.new
#
# puts "Contact with Plane: #{plane_two}"
#
# puts "Going to ask them to land..."
#
# airport_one.land(plane_two)
#
# puts "Hmm... they landed because the weather's good"

    # As the system designer
    # So that the software can be used for many different airports
    # I would like a default airport capacity that can be overridden as appropriate

puts "Creating a small airport"

airport_small = Airport.new(2)

puts "Airport created: #{airport_small}.\nIts capacity is #{airport_small.capacity}."

    # As an air traffic controller
    # To ensure safety
    # I want to prevent landing when the airport is full

puts "Contacting planes to land..."

airport_small.capacity.times { airport_small.land(Plane.new) }

puts "There are #{airport_small.planes_in_hangar.length} planes in the hangar now."

puts "Landing one more plane..."

airport_small.land(Plane.new)

puts "Hmm... they shouldn't have been able to land!"
