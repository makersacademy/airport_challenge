require_relative './exceptions'
require_relative './weather'

class Airport
  DEFAULTS = { capacity: 10, weather_forecast: Weather.new }

  attr_reader :planes, :weather_forecast
  attr_accessor :capacity

  def initialize(args = Hash.new)
    args = DEFAULTS.merge(args)
    @planes = []
    @capacity = args[:capacity]
    @weather_forecast = args[:weather_forecast]
  end

  def land(plane)
    raise AirportError, "Weather is stormy, cannot land." if stormy?
    raise PlaneError, "Plane already on the ground" unless plane.flying?
    raise AirportError, "Airport full" if full?
    plane.land(self)
    planes << plane
  end

  def release(plane)
    raise AirportError, "Weather is stormy, cannot take off." if stormy?
    raise PlaneError, "Plane already in-flight" if plane.flying?
    raise AirportError, "Plane not in current airport" unless registered?(plane)
    plane.take_off
    planes.delete(plane)
  end

  def registered?(plane)
    planes.include?(plane)
  end

  def full?
    planes.length == capacity
  end

  def stormy?
    weather_forecast.stormy?
  end

end
