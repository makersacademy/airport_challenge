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
    raise 'Too stormy to land' if airport.stormy?
    raise 'Airport is full' if airport.full?
    raise 'Plane already landed' if self.landed == true
    airport.planes << self
    @landed = true
  end

  def take_off(airport)
    raise 'Too stormy to take off' if airport.stormy?
    raise 'Plane already taken off' if self.landed == false
    raise 'Plane not at that airport' if !airport.planes.include? self
    airport.planes.delete(self)
    self.plane_status
  end


end
