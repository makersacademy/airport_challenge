require_relative "plane"
require_relative "weather"

class Airport
  CAPACITY = 20

  def initialize
    @planes = []
    update_forecast
  end
  
  def land(plane)
    raise "At capacity" if full
    raise "Permission denied due to weather" unless safe_to_fly?

    @planes << plane
    return "roger wilko"
  end

  def take_off(plane)
    raise "No such plane" unless @planes.include?(plane)

    @planes.delete(plane)
    return "In the air"
  end

  def update_forecast
    @forecast = Weather.new
  end

  def full
    @planes.length >= CAPACITY
  end

  def safe_to_fly?
    return false if @forecast.stormy?
    
    true
  end
end
