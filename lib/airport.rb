require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Airport is full' if full?
    @planes << plane
  end

  def launch(weather)
    raise 'Weather warning' if weather.stormy?
    @planes.pop
  end

  private

  def full?
    @planes.count >= @capacity
  end

end
