require_relative "plane"
require_relative "weather"

class Airport
  attr_reader :planes

  def initialize(weather = Weather.new)
    @planes = []
    @weather = weather
  end

  def land(plane)
    raise "Cannot land due to stormy weather" if stormy?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    raise "Cannot takeoff due to stormy weather" if stormy?
    plane.take_off
    @planes.delete(plane)
  end

  private

  def stormy?
    @weather.stormy?
  end

end
