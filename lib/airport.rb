class Airport
  attr_reader :landing_strip, :departure

  def initialize
    @landing_strip = []
  end

  def land(plane)
    @landing_strip << plane
    "Safely landed"
  end

  def take_off
    @departure = @landing_strip.pop
    "flight number #{departure} is no longer at the airport"
  end

end

class Plane

  def initialize
    @plane
  end

end
