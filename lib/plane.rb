class Plane
  attr_accessor :location

  def initialize
    @location = "Flying"
  end

  def land(airport)
    fail "You must be airborne to land" unless @location == "Flying"

    airport.skies_clear
    @location = airport.name
    airport.log_plane(self)

  end

  def take_off(airport)
    airport.skies_clear
    @location = "Flying"
  end
end
