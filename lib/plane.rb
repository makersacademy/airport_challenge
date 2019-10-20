require_relative 'airport'

class Plane
  attr_reader :location
  def land(airport)
    airport.incoming_plane(self)
    @location = airport
  end

  def take_off
    @location.outgoing_plane(self)
    @location = "air"
  end
end
