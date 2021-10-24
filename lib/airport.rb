class Airport 
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 5

  def initialize(input_capacity = DEFAULT_CAPACITY)
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