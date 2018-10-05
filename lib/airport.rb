

class Plane

  def initialize(location="sky")
    @location = location
  end

  def land(airport)
    fail("Can't land - too stormy!") if airport.weather == "stormy"
    fail("Airport is full!") if airport.full?
    fail("Can't land when already in an airport!") unless @location == "sky"
    @location = airport
    airport.planes << self
  end

  def take_off(airport)
    fail("Can't take off - too stormy!") if airport.weather == "stormy"
    fail("The plane is not in that airport. The plane's current location is #{@location}") unless (@location == airport && @location != "sky")
    @location = "sky"
    airport.planes.delete(self)
  end

  def in?(airport)
  end

  attr_reader :location

  private
  attr_writer :location
end

class Airport
  attr_accessor :capacity, :weather, :planes
  DEFAULT_CAPACITY = 5

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @weather = get_weather
    @planes = []
  end

  def full?
    @planes.length >= @capacity
  end

  private
  def get_weather
    if rand(10) == 0
      "stormy"
    else
      "sunny"
    end
  end


end
