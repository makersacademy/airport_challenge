class Airport
  DEFAULT_CAPACITY = 10

  attr_accessor :capacity

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def instruct_plane_to_take_off plane
    plane.takeoff
    release_plane(plane)
  end

  def instruct_plane_to_land plane
    plane.land
    receive_plane plane
  end

  def release_plane plane
    planes.delete(plane)
  end

  def receive_plane plane
    fail "Airport Full" if full?
    planes << plane
  end

  def empty?
    planes.empty?
  end

  def full?
    planes.count >= capacity
  end

  private

  attr_accessor :planes

end
