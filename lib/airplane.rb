require_relative 'airport'
require_relative 'weather'

class Airplane
  attr_reader :landed

  def initialize
    @landed = true
  end

  def plane_status
    @landed = !@landed
  end

  def land_plane(airport)
    fail 'Too stormy to land' if airport.stormy?
    fail 'Airport is full' if airport.full?
    fail 'Plane already landed' if self.landed == true
    airport.planes << self
    @landed = true
  end

  def take_off(airport)
    fail 'Too stormy to take off' if airport.stormy?
    fail 'Plane already taken off' if self.landed == false
    fail 'Plane not at that airport' if !airport.planes.include? self
    airport.planes.delete(self)
    self.plane_status
  end


end
