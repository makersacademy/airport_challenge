require './lib/Plane'

class Airport
  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Airport at full Capacity' if full?
    @planes << plane
  end

  def take_off
  end

  private

  def full?
  @planes.count >= @capacity
  end

end
