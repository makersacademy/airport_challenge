require_relative 'weather_forecast' # Is this necessary?

class Airport
  attr_reader :planes

  def initialize(capacity, weather_forecast)
    @weather_forecast = weather_forecast
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Cannot land plane: airport full' if full?
    raise 'Cannot land plane: weather is stormy' if stormy?
    @planes.push(plane)
  end

  def take_off(plane)
    raise 'Cannot take off plane: weather is stormy' if stormy?
    @planes.delete(plane)
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    @weather_forecast.stormy?
  end
end
