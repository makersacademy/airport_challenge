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
    @landed = true
  end

  def take_off
    self.plane_status
  end


end
