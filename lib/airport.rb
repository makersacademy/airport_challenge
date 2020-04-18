class Airport
  attr_reader :planes, :capacity, :weather_reporter
  
  DEFAULT_CAPACITY = 10
  
  def initialize(capacity = DEFAULT_CAPACITY, weather_reporter = WeatherReporter.new)
    @planes = []
    @capacity = capacity
    @weather_reporter = weather_reporter
  end
  
  def dock(plane)
    @planes << plane
  end
  
  def undock(plane)
    raise "It's too stormy to take off." if @weather_reporter.check_weather == "Stormy"
    @planes.delete(plane)
  end
  
  def docked?(plane)
    @planes.include?(plane)
  end
  
  def full?
    return true if @planes.length >= capacity
    false
  end
end