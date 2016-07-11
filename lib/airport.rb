class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :planes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes =[]
    @capacity = capacity
  end

  def takeoff
  end

  def land(plane)
    fail "Airport is full. Not allowed to land." if full?
    planes << plane
  end

  private

  def full?
    true if planes.count >= capacity
  end


end
