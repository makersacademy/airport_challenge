

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :planes
  attr_accessor :capacity

  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end
  
  def land(plane)
    raise 'Airport full' if full?
    planes << plane
  end

  def take_off
    planes.pop
  end

  private

  def full?
    planes.count >= capacity
  end
end
