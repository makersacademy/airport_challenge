class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise 'Airport is full!' if full?
    @planes << plane
  end

  def take_off
    raise 'Take off is cancelled due to bad weather!' if stormy?
    @planes.pop
  end

  private

  def full?
    @planes.count == capacity
  end

  def stormy?
    rand(1..6) > 4
  end

end
