class Airport

  DEFAULT_CAPACITY = 20
  attr_reader :capacity
  attr_reader :planes

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def full
    return true if planes.count == capacity
    false
  end

end