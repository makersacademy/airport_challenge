class Airport
  attr_reader :capacity
  attr_reader :docked_planes
  DEFAULT_CAPACITY = 40

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity #capacity refers to the number of planes the airport can hold
    @docked_planes = []
  end

  def remove_plane(plane)
    @docked_planes.delete(plane)
  end

  def add_plane(plane)
    @docked_planes << plane
  end
end
