require_relative 'plane'

class Airport
  attr_reader :plane

  def landing_plane
  Plane.new
  end

  def land(plane)
    @plane = plane
  end

  def take_off(plane)
  end


end
