class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise 'Airport is full!' if @planes.count == capacity
    @planes << plane
  end

  def take_off
    @planes.pop
  end

end
