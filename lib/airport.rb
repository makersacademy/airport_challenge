require_relative 'air_traffic_control'

# responsible for holding plane objects and tracking capacity & local weather
class Airport
  include AirTrafficControl

  DEFAULT_CAPACITY = 50

  attr_accessor :capacity

  def initialize(args = {})
    @capacity = args[:capacity] || DEFAULT_CAPACITY
    @weather = args[:weather] || Weather.new
    @planes = []
  end

  def contain?(plane)
    planes.include?(plane)
  end

  def weather_forcast
    weather.forcast
  end

  private

  attr_reader :planes, :weather

  def full?
    planes.count >= capacity
  end
end
