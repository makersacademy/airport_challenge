require './lib/plane'

class Airport
  attr_reader :current_plane

  def land(plane_to_land)
    @current_plane = plane_to_land
  end

  def take_off
    @current_plane
  end
end
