class Airport
  attr_reader :landing_strip, :departure
  attr_accessor :weather

  def initialize
    @landing_strip = []
    @weather = ""
  end

  def land(plane)
    fail 'Sorry, too stormy' if @weather == "Stormy"
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
