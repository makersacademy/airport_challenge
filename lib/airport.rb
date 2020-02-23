require_relative 'plane'

class Airport
  def initialize
    @planes = []
  end

  def land_plane(plane)
    @planes << plane
  end

  def plane_count
    @planes.count
  end

  def take_off(plane)
    @planes.delete(plane)  
  end
end
