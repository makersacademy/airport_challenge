class Plane
  attr_reader :location

  # lands a plane at an airport
  def land(airport)
    airport.add_plane(self)
    @location = airport.name
  end
  
end
