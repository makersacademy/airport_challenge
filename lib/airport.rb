class Airport

  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity: DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def full?
    @planes.count <= DEFAULT_CAPACITY
  end

  def track(plane)
    @planes << plane if plane.status == :landed
    @planes.delete(plane) if plane.status == :taken_off
  end

end
