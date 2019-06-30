require_relative 'plane'
require_relative 'weather'
class Airport

  attr_reader :landed_planes
  attr_reader :weather
  attr_reader :capacity

  DEFAULT_CAPACITY = 10

  def initialize
    @landed_planes = []
    @weather = Weather.new
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    fail 'Can not take off in stormy weather' if @weather.stormy?
    fail 'Airport is full' if full?

    @landed_planes << plane
  end

  def full?
    if @landed_planes.length >= @capacity
      true
    else
      false
    end
  end

  def depart
    fail 'Can not take off in stormy weather' if @weather.stormy?

    @landed_planes.pop
  end

end
