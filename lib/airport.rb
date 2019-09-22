require_relative "plane"
require_relative "weather"

class Airport
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    update_forecast
  end
  
  def land(plane)
    raise "At capacity" if full
    raise "Already landed!" if @planes.include?(plane)
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
    @planes.length >= @capacity
  end

  def safe_to_fly?
    return false if @forecast.stormy?

    true
  end
end
