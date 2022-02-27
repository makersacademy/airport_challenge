class Plane
  def initialize
    @plane
  end
  
  def land(plane, airport)
    airport.receive_plane(plane)
  end
end
