class Plane
  attr_reader :location, :current_airport

  def initialize
    @current_airport = nil
  end

  # lands a plane at an airport
  def land(airport)
    airport.add_plane(self)
    @current_airport = airport
    @location = airport.name
  end

  # takes the plane off
  def take_off
    @current_airport.remove_plane(self)
    @location = "Flying"
  end

end
