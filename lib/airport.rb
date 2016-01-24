class Airport

  DEFAULT_CAPACITY = 20
  attr_accessor :capacity
  attr_reader :planes

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity, @planes = capacity, []
  end

  def full
    return true if planes.count == capacity
    false
  end

end