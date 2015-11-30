require_relative '../lib/plane.rb'
require_relative '../lib/weather.rb'

class Airport

DEFAULT_CAPACITY = 50

attr_reader :planes, :capacity

  def initialize(capacity)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    raise 'airport full' if full?
    raise 'cannot land with this weather' if weather.stormy?
    plane.land(self)
    @planes << plane
  end

  def takeoff(plane)
    raise 'cannot takeoff with this weather' if weather.stormy?
    plane.takeoff(self)
    @planes.pop
  end

private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    Weather.stormy?
  end

end
