

class Plane

  def initialize(location=Airport.new)
    @location = location
  end

  def land(airport)
    fail("Can't land - too stormy!") if airport.weather == "stormy"
    @location = airport
    airport.planes << self
  end

  def take_off(airport)
    fail("Can't take off - too stormy!") if airport.weather == "stormy"
    @location = "sky"
    airport.planes.delete(self)
  end

  def in?(airport)
  end

  attr_accessor :location
end

class Airport
  def initialize(capacity=5)
    @capacity = capacity
    @weathers = ["sunny", "stormy"]
    @weather = "sunny"
    # @weather = @weathers[rand(2)]
    @planes = []
  end

  def full?
    true
  end
  attr_accessor :capacity, :weather, :planes
end
