class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def full?
    return planes.length >= DEFAULT_CAPACITY
  end
end
