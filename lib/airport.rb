class Airport
  attr_reader :outlook
  attr_reader :capacity
  attr_reader :planes
  attr_reader :weather

  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new.outlook)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def stormy?
    @weather == "stormy"
  end

  def land(plane = Plane.new)
    fail "Unable to land due to #{@weather} weather" if @weather == "stormy"
    fail "Unable to land. Airport at capacity!" if @planes.length >= @capacity
    @planes.push(plane)
  end

  def takeoff(plane = Plane.new)
    fail "Unable to takeoff due to #{weather} weather" if @weather == "stormy"
    @planes.delete(plane)
    return "Plane is no longer at #{self}" unless @planes.include?(plane)

  end

end

class Weather

  attr_reader :outlook

  def initialize
    @outlook = weather_generator
  end

  def weather_generator
    weather_options = ["stormy", "sunny", "sunny", "sunny"]
    weather_options[(rand * 4).to_i]
  end

  def stormy?
    @outlook == "stormy"
  end
end

class Plane
end
