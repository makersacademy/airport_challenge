class Airport

  attr_reader :planes
  attr_accessor :weather
  attr_accessor :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def full?
    @planes.count >= @capacity
  end

end
