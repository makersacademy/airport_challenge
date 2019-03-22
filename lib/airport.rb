class Airport
  DEFAULT_CAPACITY = 5
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def full?
    @planes.size >= @capacity
  end
end
