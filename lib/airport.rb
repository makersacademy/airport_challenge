require_relative "plane"
 
class Airport
  attr_reader :planes
    
  def initialize
    @planes = []
  end

  def land_plane(plane)
    @planes.push(plane)
  end

  def take_off(plane)
    @planes.delete(plane)
    @planes
  end

  def return_planes
    @planes
  end
end
