require_relative 'airport'

class Airplane
attr_reader :landed

  def initialize
    @landed = true
  end

  def plane_status
    @landed = !@landed
  end

  def land_plane(airport)
    raise 'Airport is full' if airport.full?
    raise 'Plane already landed' if self.landed == true
    airport.planes << self
    @landed = true
  end

  def take_off(airport)
    raise 'Plane already taken off' if self.landed == false
    raise 'Cannot take off because plane not at that airport' if !airport.planes.include? self
    airport.planes.delete(self)
    self.plane_status
  end


end
