require_relative 'airport'

class Plane
  attr_reader :landed

  def initialize
    @landed = true
  end

  def land(airport)
    airport.receive_plane(self)
  end

  def takeoff(airport)
    @landed = false
    airport.release_plane(self)
  end

end
