require_relative 'plane'

class Airport
  attr_reader :flying_plane, :stationary_plane

  def take_off(plane = Plane.new)
    @flying_plane = plane
  end

  def land(plane)
    @stationary_plane = plane
  end
end
