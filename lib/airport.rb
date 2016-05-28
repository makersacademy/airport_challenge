class Airport
  attr_reader :current_planes
  def initialize
    @current_planes = []
  end
  
  def land(plane)
    @current_planes.push(plane)
    plane.set_landed
  end
end
