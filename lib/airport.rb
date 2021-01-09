class Airport

  def initialize
    @planes = []
  end

  def contains?(plane)
    @planes.include?(plane)
  end

  def add_plane(plane)
    @planes << plane
  end

  def remove_plane(plane)
    @planes -= [plane]
  end
end

class Plane
  attr_reader :airport

  def initialize(airport = nil)
    check_valid_airport_ignore_nil(airport)
    airport.add_plane(self) unless airport.nil?
    @airport = airport
  end

  def land(airport)
    check_valid_airport(airport)
    airport.add_plane(self)
    self
  end

  def take_off
    @airport.remove_plane(self)
    "#{self} has taken off from #{@airport}"
  end

  def check_valid_airport_ignore_nil(airport)
    raise "Not a valid airport" if airport && !airport.is_a?(Airport)
  end

  def check_valid_airport(airport)
    raise "Not a valid airport" unless airport.is_a?(Airport)
  end

end
