require './lib/plane'
require './lib/weather'

class Airport

  DEFAULT_CAPACITY = 20

  attr_accessor :planes, :weather

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = weather
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
