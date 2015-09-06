class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :capacity, :planes, :allow_landing

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @allow_landing = true
  end

  def allow_landing?
    allow_landing
  end

  def receive_plane(plane)
    planes << plane if allow_landing?
    @allow_landing = false if full?
  end

  def release_plane(plane)
    fail 'Plane not at this airport' unless planes.include?(plane)
    while planes.last != plane
      planes.rotate!
    end
    planes.pop
  end

  private

  def full?
    return true if planes.count == capacity
    false
  end

end
