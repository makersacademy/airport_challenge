class Airport

  attr_reader :landed_planes
  attr_reader :weather
  attr_reader :capacity

  def initialize(capacity = 10)
    @landed_planes = Array.new
    @capacity = capacity
    weather_forecast
  end

  def arrival(plane)
    return false if stormy_weather? || landed_planes.size == @capacity
    @landed_planes << plane
    true
  end

  def departure(plane)
    return false if stormy_weather? || plane.location != self
    @landed_planes.delete plane
    true
  end

  def weather_forecast
    rand(100) < 80 ? @weather = "fine" : @weather = "stormy"
  end

  def fine_weather?
    weather == "fine"
  end

  def stormy_weather?
    weather == "stormy"
  end

end
