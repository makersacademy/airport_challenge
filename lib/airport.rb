require_relative './exceptions'
require_relative './weather'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
    @weather_forecaster = Weather.new
  end

  def land(plane)
    raise AirportError, "Weather is stormy, cannot land." if stormy?
    plane.land(self)
    planes << plane
  end

  def release(plane)
    raise AirportError, "Weather is stormy, cannot take off." if stormy?
    plane.take_off
    planes.delete(plane)
  end

  private

  def stormy?
    @weather_forecaster.stormy?
  end
end
