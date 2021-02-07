require_relative 'air_traffic_control'
# responsible for holding plane objects and tracking capacity & local weather
class Airport
  include AirTrafficControl

  DEFAULT_CAPACITY = 50

  attr_accessor :capacity

  def contain?(plane)
    planes.include?(plane)
  end

  def weather_forcast
    weather.forcast
  end

  private

  attr_reader :planes, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = weather_generator # memoizes weather object, instead of creating a new one for each forcast
  end

  def full?
    planes.count >= capacity
  end

  def weather_generator
    Weather.new
  end
end
