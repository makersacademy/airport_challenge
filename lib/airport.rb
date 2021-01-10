require 'weather_forecast'

class Airport

  DEFAULT_CAPACITY = 20
  
  def initialize(weather_forecast, capacity = DEFAULT_CAPACITY)
    @weather_forecast = weather_forecast
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "Cannot land plane - airport full" if full?
    raise "Cannot land plane - stormy weather" if stormy?
    @planes << plane
  end

  def take_off(plane)
    raise "Cannot take off plane - stormy weather" if stormy?
    raise "Plane taken off - no longer in the airport" unless at_airport?(plane)
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def stormy?
    @weather_forecast.stormy?
  end

  def at_airport?(plane)
    @planes.include?(plane)
  end
end