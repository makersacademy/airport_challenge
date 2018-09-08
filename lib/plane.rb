require "airport"

class Plane

  def intialze
    @location
  end

  def land_at(airport)
    @location = airport
  end

  def take_off
    @location = "In the air."
  end

end
