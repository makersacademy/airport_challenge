class Airport 
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 1

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    fail 'landing prohibited: airport is full' if full?
    @planes << plane
  end

  def take_off(plane)
    @planes.pop()
  end

private

  def full?
    @planes.count >= capacity
  end
end