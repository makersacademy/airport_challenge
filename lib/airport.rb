class Airport

  attr_reader :landed_planes
  attr_reader :capacity
  attr_reader :weather

  def initialize(capacity = 10)
    @landed_planes = Array.new
    @capacity = capacity
    @weather = Weather.new
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

  def fine_weather?
    weather.weather_report == "fine"
  end

  def stormy_weather?
    weather.weather_report == "stormy"
  end

end
