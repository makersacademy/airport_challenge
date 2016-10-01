class Airport
  attr_reader :capacity, :planes
  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def add(plane)
    fail "Cannot add. Airport is full!" if full?
    fail "Cannot add flying planes to airport" if plane.flying?
    planes << plane
  end

  private

  def full?
    planes.count >= capacity
  end
end
