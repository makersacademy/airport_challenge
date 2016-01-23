require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize(weather)
    @planes = []
    @weather = weather
  end

  def land(plane)
    fail 'Cannot land on a storm!' if @weather.stormy?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    plane.take_off
    @planes.delete(plane)
  end
end
