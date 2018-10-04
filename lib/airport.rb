class Plane
  def initialize(location=Airport.new)
    @location = location
  end
  def land(airport)
    @location = airport
    airport.planes << self
  end
  def take_off(airport)
  end
  def in?(airport)
  end

  attr_accessor :location
end

class Airport
  def initialize(capacity=5, weather="sunny")
    @capacity = capacity
    @weather = weather
    @planes = []
  end

  def full?
    true
  end
  attr_accessor :capacity, :weather, :planes
end
