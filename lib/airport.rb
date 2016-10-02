require_relative "plane"
require_relative "weather"

class Airport
  attr_reader :planes

  def initialize(weather = Weather.new)
    @planes = []
    @weather = weather
  end

  def land(plane)
    plane.land
    @planes << plane
  end

  def take_off(plane)
    if stormy? == true
      raise "Cannot takeoff due to stormy weather"
    end
    plane.take_off
    @planes.delete(plane)
  end

  def stormy?
    @weather.stormy?
  end
end
