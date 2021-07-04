class Airport
  attr_accessor :planes
  attr_reader :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def full?
    @planes.length >= DEFAULT_CAPACITY
  end

  def stormy?
    rand(10) == 1
  end
end
