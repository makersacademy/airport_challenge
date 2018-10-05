require_relative "plane"

class Airport
  def release_plane
    Plane.new
  end

  def land(plane)
    @plane = plane
  end

  attr_reader :plane

end
