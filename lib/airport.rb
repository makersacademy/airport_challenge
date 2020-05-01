require_relative 'plane'

class Airport
  def initialize
    @plane = []
  end

  def land(plane)
    @plane << plane
  end

  def takeoff
    @plane.pop
    "The plane instructed has now left the airport"
  end
end
