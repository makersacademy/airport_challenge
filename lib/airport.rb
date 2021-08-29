require_relative "plane"

class Airport
  def land_plane(plane)
    @plane = plane
  end

  def take_off
    @plane = nil
  end
end
