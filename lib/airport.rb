require_relative 'weather'
require_relative 'plane'

class Airport

  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 200

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def accept_landing_plane(plane, weather)
    fail 'Airport is full' if @planes.length == @capacity
    weather.stormy? ? @planes : @planes << plane
  end

  def takeoff(plane, weather)
    @planes = [plane]
    if weather.stormy?
      @planes
    else
      @planes.pop
      @planes
    end
  end

end
