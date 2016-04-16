require_relative 'plane'

class Airport

  attr_reader :plane

  def launch_plane
    Plane.new
  end

  def land(plane)
    @plane = plane
  end

end