class Airport

  DEFAULT_CAPACITY = 10
  attr_reader :capacity
  attr_reader :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def closed?
  end

  def land(plane)
    @planes << plane
  end

  def take_off
    @planes.pop
  end
end
