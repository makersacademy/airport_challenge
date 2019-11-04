require './lib/plane.rb'
class Airport
  attr_reader :planes, :capacity

  def initialize(capacity = 20)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport is full' if full?
    @planes << plane
  end

  def takeoff(plane)
    @planes.delete(plane)
  end

  def full?
if @planes.length > 0
  return true
  end
end

def stormy?
end

end
