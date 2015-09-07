class Airport

  attr_reader :planes
  attr_reader :capacity

  def initialize(capacity = 10, weather=Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def plane_take_off
    traffic_control
    planes[0].take_off
    planes.shift
  end

  def plane_landing(plane)
    traffic_control
    fail "FULL" if full?
    plane.land
    planes << plane
  end

  def traffic_control
    fail "The weather is stormy!" if weather_stormy?
  end

  def weather_stormy?
    @weather.stormy?
  end

  private

  def full?
    planes.count >= capacity
  end

end

class Weather

  def stormy?
    rand < 0.2
  end
end
