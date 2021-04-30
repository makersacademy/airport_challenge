require "plane.rb"

class Airport
  attr_reader :planes
    
  def initialize
    @planes = []
  end

  def land_plane(plane)
    @planes.push(plane)
  end

  def return_planes
    @planes
  end
end
