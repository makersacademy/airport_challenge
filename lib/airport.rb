class Airport 
  attr_reader :planes, :capacity, :weather
  DEFAULT_CAPACITY = 5

  def initialize(input_capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = DEFAULT_CAPACITY
    @weather = :unknown
  end

  def land(plane)
    fail 'landing prohibited: airport is full' if full?
    @planes << plane
  end

  def take_off(plane)
    fail 'Take off aborted: the weather is stormy' if stormy?
    @planes.delete(plane)
  end

  def weather_forecast(forecast = Weather.new)
    @weather = forecast.forecast
  end

  def stormy?
    @weather == :stormy
  end

private

  def full?
    @planes.count >= capacity
  end
end