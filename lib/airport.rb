class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :capacity, :planes

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def allow_landing?
    true
  end

  def receive_plane(plane)
    planes << plane
  end

end
