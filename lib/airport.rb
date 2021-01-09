class Airport
  # attr_reader :planes

  def initialize
    @planes = []
  end

  def contains?(plane)
    @planes.include?(plane)
  end

  def add_plane(plane)
    @planes << plane
  end
end

class Plane
  def land(airport)
    airport.add_plane(self)
    self
  end

  def take_off
  end

end
