require_relative "plane"
require_relative "weather"

class Airport
  CAPACITY = 20

  def initialize
    @planes = []
    @safe_to_fly = true
    weather_forecast
  end
  
  def land(plane)
    raise "At capacity" if full
    raise "Permission denied due to weather" unless safe?

    @planes << plane
    return "roger wilko"
  end

  def take_off(plane)
    raise "No such plane" unless @planes.include?(plane)

    @planes.delete(plane)
    return "In the air"
  end

  private

  def full
    @planes.length >= CAPACITY
  end

  def weather_forecast
    @forecast = Weather.new
  end

  def safe?
    @safe_to_fly = false if @forecast.stormy?
    @safe_to_fly
  end
end
