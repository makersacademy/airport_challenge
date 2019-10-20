require_relative 'airport'
require_relative 'plane'

# Create objects
Heathrow = Airport.new(capacity = 100)
boeing_747 = Plane.new
boeing_737 = Plane.new

# Get flying status
puts boeing_747.flying # => true

Heathrow.receive(boeing_747)
Heathrow.receive(boeing_737)
puts boeing_747.airport # => <airport ID>

p Heathrow.hangar # => [<Plane:0x00007fea1e0c70c8>]
puts boeing_747.flying # => false

Heathrow.receive(boeing_747) # => Plane already in airport! (RuntimeError)

Heathrow.allow_take_off(boeing_737)