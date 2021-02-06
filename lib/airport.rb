require_relative 'air_traffic_control'
# responsible for holding plane objects and tracking capacity & local weather
class Airport
  include AirTrafficControl

  DEFAULT_CAPACITY = 50

  attr_reader :planes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def not_contain?(plane)
    planes.none?(plane)
  end

  def weather
    weather_forcast
  end

  private

  def full?
    planes.count >= capacity
  end

  def weather_forcast
    Weather.new.forcast
  end
end
