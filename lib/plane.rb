require_relative 'airport'

class Plane

  attr_reader :airport_id

  def initialize
    @landed = false
    @airport_id = :airborne
  end

  def landed?
    @landed
  end

  def land(airport)
    @airport_id = airport.object_id
    @landed = true
    airport.landed_planes << self
    self
  end

  def take_off
    @landed = false
    ObjectSpace._id2ref(airport_id).landed_planes.pop
    @airport_id = :airborne
  end

end
