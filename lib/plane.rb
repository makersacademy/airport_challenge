class Plane

  attr_reader :on_ground
  attr_reader :location

  def initialize
    @on_ground = false
    @location = nil
  end

  def land(airport)
    if airport.accept_plane(self)
      @on_ground = true
      @location = airport
      return "Plane landed at #{airport}."
    else
      return "Airport would not accept plane.  Unable to land."
    end
  end

end