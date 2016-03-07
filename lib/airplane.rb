require_relative 'airport'
require_relative 'weather'

class Airplane
  attr_reader :landed

  def initialize
    @landed = false
  end

  def plane_status
    @landed = !@landed
  end

  def land_plane
    # raise 'Plane already landed' if self.landed == true
    @landed = true
  end

  def take_off
    # raise 'Plane already taken off' if self.landed == false
    self.plane_status
  end


end
