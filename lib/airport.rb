class Airport
  attr_reader :capacity, :planes
  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  private

  def add(plane)
    fail_if_full
    planes << plane
  end

  def fail_if_full
    fail "Airport is full!" if full?
  end

  def full?
    planes.count >= capacity
  end
end
