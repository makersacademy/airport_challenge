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
    if allow_landing?
      planes << plane
      if planes.count == capacity
        @allow_landing = false
      end
    else
      "Airport full"
    end
  end

end
