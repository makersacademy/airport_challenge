require './lib/plane'
require './lib/weather'

class Airport
  attr_accessor :planes, :weather

  def initialize
    @planes = []
    @capacity = 2
    @weather = Weather.new
  end

  def land(plane)
    fail 'Cannot land due to stormy weather' if @weather.stormy?
    fail 'Airport full!' if @planes.count == @capacity
    fail 'Plane already landed!' if @planes.include? plane
    @planes << plane
    plane.land
    plane
  end

  def takeoff(plane)
    fail 'Cannot takeoff due to stormy weather' if @weather.stormy?
    fail 'Airport empty!' if @planes.empty?
    fail 'Plane already airborne!' unless @planes.include? plane
    planes.delete(plane)
    plane.takeoff
    plane
  end


end
