class Airport

    attr_reader :planes
    attr_reader :capacity

    # DEFAULT_CAPACITY = 10

  def initialize(capacity = 10)
    @planes = []
    @capacity = capacity
  end

  def plane_landed(plane_name)
      # raise "This airport is full to capacity, please go to the next nearest airport to land" if full?
     "Plane #{plane_name} has landed"
  end

  def store_plane(plane_name)
    @planes << plane_name
  end

  # def full?
  #   @planes.count == DEFAULT_CAPACITY
  # end
end
