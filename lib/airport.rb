require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport
  attr_reader :planes, :weather

  def initialize(weather = Weather.new)
    @planes = []
    @weather = weather
  end

  def land(plane)
    raise 'cannot land in stormy weather' if @weather.stormy?
    plane.land
    @planes << plane
  end

  def takeoff(plane)
    raise 'cannot takeoff in stormy weather' if @weather.stormy?
    plane.takeoff
    @planes -= [plane]
  end

  def in_airport?(plane)
    @planes.include?(plane)
  end
end
