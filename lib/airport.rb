class Airport

  attr_accessor :planes, :capacity, :weather

  DEFAULT_CAPACITY = 2

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = ["sunny", "sunny", "sunny", "sunny", "sunny", "stormy"][rand(6)]
  end

  def full?
    @planes.length == capacity
  end
end
