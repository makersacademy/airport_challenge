class Airport
attr_reader :planes
DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def instruct_plane_to_land(plane)
    raise 'Cannot land - airport is full' if is_full?
    raise 'Too stormy to land' if is_stormy?
    @planes << plane
  end

  def instruct_plane_to_take_off(plane)
    raise 'Too stormy to take off' if is_stormy?
    @planes.delete_at(@planes.find_index(plane))
  end

private

  def is_stormy?
     rand(6) >= 4 ? true : false
  end

  def is_full?
    @planes.count >= @capacity ? true : false
  end

end