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
    @weather = weather_station # memoizes weather object
    @planes = []
  end

  def full?
    planes.count >= capacity
  end

  def weather_station
    Weather.new
  end
end
