require_relative "airport"

class Plane
  attr_reader :airbourne
  def initialize
    @airbourne = true
  end

  def land(airport)
    fail 'Plane not in the air' if (airbourne == false)

    @airbourne = false if airport.receive_plane(self)
  end

  def take_off(airport)
    @airbourne = true if airport.release_plane(self)
    return "Plane has departed the airport"
  end
end
