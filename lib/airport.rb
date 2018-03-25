require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :capacity, :weather
  DEFAULT_CAPACITY = 20
  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Airport is full to capacity' if full?
    raise 'Cannot land due to storm' if stormy?
    @planes << plane
  end

  def takeoff(plane)
    raise 'Unable to take off in stormy weather' if stormy?
    @planes.pop
  end

  private

  def full?
    planes.count >= capacity
  end

  def stormy?
    weather.stormy?
  end

end
