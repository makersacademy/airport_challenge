require_relative 'plane'
require_relative 'weather'
class Airport

  attr_reader :landed_planes
  attr_reader :capacity

  DEFAULT_CAPACITY = 10

  def initialize
    @landed_planes = []
    @weather = Weather.new
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    raise(RuntimeError, 'Can not take off in stormy weather') if @weather.stormy?
    raise "Airport is full" if full?

    @landed_planes << plane
  end

  def full?
    @landed_planes.length >= @capacity
  end

  def depart(plane)
    raise(RuntimeError, 'Can not take off in stormy weather') if @weather.stormy?

    @landed_planes.pop(plane)
  end
end
