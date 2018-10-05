require_relative 'airport'
class Plane
  attr_reader :location

  def initialize
    @location = "AIR"
  end

  def land(airport)
    airport.receive_plane(self)
    @location = "AIRPORT"
  end

  def take_off(airport)
    airport.release_plane(self)
    @location = "AIR"
  end

end
