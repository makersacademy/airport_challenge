require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes
  attr_reader :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def landing(plane)
    weather_forecast
    fail 'Airport is full' if full?
    @planes << plane
  end

  def take_off
    weather_forecast
    fail 'No flights avialible' if empty?
    @planes.pop
  end

  private

  def weather_forecast
    Weather.new.weather_conditions
  end

  def full?
    @planes.count >= @capacity
  end

  def empty?
    @planes.empty?
  end
end