require_relative 'airport'

class Plane

  def initialize
    @airborne = true
    @airport_id = :airborne
  end

  def airborne?
    @airborne
  end

  def land(airport)
    fail 'Stormy weather prevents landing' if airport.stormy?
    fail 'Plane is already in an airport' if !airborne?
    fail 'Airport full' if airport.full?
    @airport_id = airport.object_id
    @airborne = false
    airport.stored_planes << self
    self
  end

  def take_off
    fail "Plane is already airborne" if airborne?
    @airborne = true
    plane = ObjectSpace._id2ref(airport_id).stored_planes.pop
    @airport_id = :airborne
    plane
  end

private

attr_reader :airport_id

end
