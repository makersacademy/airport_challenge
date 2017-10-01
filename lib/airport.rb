require './lib/plane'
require './lib/weather'

class Airport

  attr_reader :plane
  attr_accessor :weather

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land_at_airport(plane)
    @plane = plane
    fail "Stormy weather not clear for landing!" if weather.stormy?
    fail "Plane already landed!" if plane.landed?
    fail "Airport full!" if @planes.count >= @capacity
    @planes << @plane
    plane.land
  end

  def take_off(plane)
    fail "Plane already gone!" unless plane.landed?
    fail "Stormy weather abort take off!" if weather.stormy?
    @planes.delete(plane)
    plane.take_off
    @planes
  end

end
