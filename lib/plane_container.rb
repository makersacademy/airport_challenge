module PlaneContainer
  attr_reader :list_planes, :capacity
  DEFAULT_CAPACITY = 100

  def setup_plane_list
    @list_planes = []
  end

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = DEFAULT_CAPACITY
    setup_plane_list
    # @list_planes = []
  end

  def plane_in(plane)
    @list_planes << plane
  end

  def plane_out(plane)
    @list_planes.delete(plane)
  end

  def full?
    # @ground_planes.length >= @capacity ? true : false
    @list_planes.length >= @capacity ? true : false
  end
end
