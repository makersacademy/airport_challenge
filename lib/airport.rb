require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :plane, :capacity, :weather_forecast
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather_forecast = Weather.new.random_weather
  end

  def land(plane)
    raise 'Airport full' if full?
    raise 'No planes can land due to stormy weather' if weather_forecast ==
"Stormy"
    @planes << plane
  end

  def take_off(*)
    raise 'No planes available' if empty?
    raise 'No planes can leave due to stormy weather' if weather_forecast ==
"Stormy"
    @planes.pop
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def empty?
    @planes.empty?
  end
end
