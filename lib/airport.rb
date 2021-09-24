class Airport
  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 30

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Unable to land, the airport is full' if airport_full?
    planes << plane
  end

  def take_off
    planes.pop
  end
  
  private
  def airport_full?
    planes.count >= capacity
  end
end
