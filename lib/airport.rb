class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :planes, :capacity

  def initialize (capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def full?
    @planes.count == capacity
  end
end
