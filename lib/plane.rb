class Plane
  attr_reader :location

  def initialize(location = "sky")
    @location = location
  end

  def land(airport)
    fail("Can't land - too stormy!") if airport.weather == "stormy"
    fail("Airport is full!") if airport.full?
    fail("Can't land when already in an airport!") unless location == "sky"
    @location = airport
    airport.planes << self
  end

  def take_off(airport)
    fail("Can't take off - too stormy!") if airport.weather == "stormy"
    fail("The plane is not in that airport.") unless in?(airport)
    @location = "sky"
    airport.planes.delete(self)
  end

  def in?(airport)
    location == airport
  end
end
