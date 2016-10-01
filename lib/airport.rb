require_relative 'plane'
require_relative 'weather'

class Airport
  def initialize
    @weather = Weather.new
    @planes = []
  end
  attr_reader :planes
  attr_reader :weather

  def land(plane)
    raise 'This plane cannot land due to stormy weather' if weather.stormy?
    @planes << plane
  end

  def take_off(plane)
    plane.take_off
    @planes.pop
  end
end
