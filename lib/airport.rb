class Airport
  attr_reader :planes, :capacity, :stormy
  DEFAULT_CAPACITY = 10

  def initialize(capacity = 10)
    @planes = []
    @capacity = capacity
    @stormy = true
  end

  def full?
    return @planes.length >= DEFAULT_CAPACITY
  end

  def is_stormy?
    @stormy
  end
end