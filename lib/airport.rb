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
  attr_reader :airport

  def initialize(airport = nil)
    raise "Not a valid airport" if airport && !airport.is_a?(Airport)
    @airport = airport
  end

  def land(airport)
    airport.add_plane(self)
    self
  end

  def take_off
  end

end
