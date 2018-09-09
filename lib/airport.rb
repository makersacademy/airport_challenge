class Airport

  attr_accessor :planes
  attr_accessor :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def modify_capacity(capacity)
    @capacity = capacity
  end

  def full?
    @planes.count >= @capacity
  end
end
