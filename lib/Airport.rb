require './lib/Plane'

class Airport
  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Airport at full Capacity' if @planes.count >= @capacity
    @planes << plane
  end

  def take_off(plane)
  end

end
