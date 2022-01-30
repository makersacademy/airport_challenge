require_relative 'plane'

class Airport

  attr_reader :plane
    
  def land_plane
    Plane.new
  end

  def take_off(plane)
    @plane = plane
  end

end
