class Airport

  attr_reader :landed_planes
  attr_reader :capacity
  attr_reader :weather

  DEFAULT_CAPACITY = 10
  LANDING_STORMY_ERROR = "Cannot land, weather is stormy"
  LANDING_RUNWAY_FULL_ERROR = "Cannot land, runway is full"
  TAKEOFF_STORMY_ERROR = "Cannot take off, weather is stormy"
  TAKEOFF_NOT_AT_AIRPORT_ERROR = "Cannot take off, plane is not at this airport"

  def initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes = Array.new
    @capacity = capacity
    @weather = Weather.new
  end

  def arrival(plane)
    fail LANDING_RUNWAY_FULL_ERROR if landed_planes.size >= capacity
    fail LANDING_STORMY_ERROR if stormy_weather?
    @landed_planes << plane
    true
  end

  def departure(plane)
    fail TAKEOFF_NOT_AT_AIRPORT_ERROR if plane.location != self
    fail TAKEOFF_STORMY_ERROR if stormy_weather?
    @landed_planes.delete plane
    true
  end

  def fine_weather?
    weather.weather_report == :fine
  end

  def stormy_weather?
    weather.weather_report == :stormy
  end

end
