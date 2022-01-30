# Defines the class Aitport
require_relative 'plane'

class Airport
  def plane
  end   

  def capacity?
  end

  def release_plane
    Plane.new
  end 

  def dock_plane(plane)
    plane
  end  
end
