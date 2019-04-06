require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :plane, :weather

  def initialize(weather)
    @weather = weather
  end

  def land(plane)
    raise "it is stormy" if weather.stormy?

    @plane = plane
  end

  def take_off
    raise "it is stormy" if weather.stormy?

    plane.taken_off?
    plane
  end
end
