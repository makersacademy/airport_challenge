module PlaneContainer
  attr_reader :capacity, :list_planes

  def setup_plane_list
    @list_planes = []
  end

  def initialize(capacity = self.class::DEFAULT_CAPACITY)
    @capacity = capacity
    setup_plane_list
  end

  def plane_in(plane)
    @list_planes << plane
  end

  def plane_out(plane)
    @list_planes.delete(plane)
  end

  def full?
    @list_planes.length >= @capacity ? true : false
  end
end
