require_relative 'plane'

class Airport
  attr_reader :plane
  @plane = []
  
  def receive_plane(plane)
    fail 'airport full' if @plane.count >= 20
  
    @plane << plane
  end
  
  def depart_plane(plane)
    @plane = plane
  end
end
