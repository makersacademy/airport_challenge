class Airport

  DEFAULT_CAPACITY = 1

  attr_reader :planes
  attr_reader :capacity
  

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity

  end

  def full?
    planes.length >= capacity
  end
end
