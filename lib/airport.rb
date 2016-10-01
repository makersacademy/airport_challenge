require 'plane.rb'
require 'weather.rb'

class Airport
  def initialize
    @weather = Weather.new
    @planes = []
    @plane = Plane.new
  end
  attr_reader :planes
  attr_reader :weather
  attr_reader :plane

  def land(plane)
    raise 'This plane cannot land due to stormy weather' if weather.stormy?
    raise 'this plane has already landed' unless plane.in_air
    @planes << plane
  end

  def take_off(plane)
    raise 'This plane cannot take_off due to stormy weather' if weather.stormy?
    plane.take_off
    @planes.pop
  end
end
