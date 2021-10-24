class Airport
  DEFAULT_CAPACITY = 50
  attr_reader :plane_capacity
  
  def initialize(plane_capacity = DEFAULT_CAPACITY)
    @planes = []
    @plane_capacity = plane_capacity
  end

  def land(landing_plane)
    fail 'No capacity at airport' if self.full?
    @planes << landing_plane
    landing_plane
  end

  def take_off
    @planes.pop
  end

  def full?
    @planes.count == @plane_capacity
  end

  def empty?
    @planes.empty?
  end
end