require './lib/Plane'

class Airport

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Airport at full Capacity' if full?
    @planes << plane
  end

  def take_off
    @planes.pop
  end

  private

  def full?
  @planes.count >= @capacity
  end

end
