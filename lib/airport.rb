require_relative 'plane'

class Airport
  attr_reader :plane
  
  def receive_plane(plane)
    @plane = plane
  end
  
  def depart_plane(plane)
    @plane = plane
  end
end
