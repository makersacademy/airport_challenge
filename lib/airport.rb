require_relative 'plane'

class Airport
  attr_reader :planes
  
  def initialize
    @planes = []
  end
  
  def land_plane(plane)
    @planes << plane
  end

  def take_off(_plane)
    plane_departure
    Plane.new true
  end

  def plane_departure
    @planes.delete_at(@planes.length - 1)
  
  end
end
