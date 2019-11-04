require_relative 'airport'
require_relative 'plane'

# Create objects
Heathrow = Airport.new(100)
boeing_747 = Plane.new
boeing_737 = Plane.new

# Get flying status
puts boeing_747.flying # => true

boeing_737.land(Heathrow)
boeing_747.land(Heathrow)
puts boeing_747.airport # => <airport ID>

puts Heathrow.hangar # => <Plane:0x00007fc738826890> , <Plane:0x00007fc738826840>
puts boeing_747.flying # => false

boeing_747.land(Heathrow) # => Plane already in airport! (RuntimeError)

Heathrow.allow_take_off(boeing_737)
puts Heathrow.hangar # => <Plane:0x00007fc738826890>