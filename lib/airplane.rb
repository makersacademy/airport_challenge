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
    airport.planes << self
    @landed = true
  end

  def take_off(airport)
    airport.planes.delete(self)
    self.plane_status
  end


end
