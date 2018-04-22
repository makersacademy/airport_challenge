class Airport

  DEFAULT_CAPACITY = 50
  attr_reader :planes, :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane, weather)
    bad_weather_msg(weather)
    error_msg(plane)
    plane.landing
    @planes << plane

  end

  def takeoff(plane, weather)
    bad_weather_msg(weather)
    fail 'there are no planes at the airport' if @planes.empty?
    plane.flying
    report_status
    @planes.delete(plane)

  end

  def report_status
    return 'plane no longer at the airport'
  end

  def error_msg(plane)
    fail 'airport is full' if @planes.size >= DEFAULT_CAPACITY
    fail 'this plane has already landed' if @planes.include?(plane)
  end

  def bad_weather?(weather)
    weather.stormy?
  end

  def bad_weather_msg(weather)
    fail 'bad weather conditions, airport closed' if bad_weather?(weather)
  end
end
