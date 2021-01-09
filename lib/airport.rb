class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def contains?(plane)
    @planes.include?(plane)
  end

end

class Plane
  def land(airport)
    airport.planes << self
    self
  end

  def take_off
  end

end
