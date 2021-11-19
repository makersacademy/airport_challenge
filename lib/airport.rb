class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = 10)
    @planes = []
    @capacity = capacity
  end

  def full?
    return @planes.length >= DEFAULT_CAPACITY
  end

  def is_stormy?
    true
  end
end