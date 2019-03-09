class Plane
  attr_accessor :location

  def initialize
    @location = "Factory runway"
  end

  def land(airport)
    fail "You must be airborne to land" unless @location == "Flying"

    @location = airport.name
    airport.log_plane(self)

  end

  def take_off
    @location = "Flying"
  end
end
