class Airport
  attr_reader :planes
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land_plane(plane)
    raise 'Plane cannot land as airport is full' if full?

    @planes << plane
  end

  def full?
    @planes.count == @capacity
  end
end
