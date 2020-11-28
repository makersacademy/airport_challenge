class Airport
  DEFAULT_CAPACITY = 1
  attr_reader :planes

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []

  end

  def land_plane(plane)
    fail "Airport full!" if @planes.length == @capacity
    @planes << plane
  end

  def take_off_plane(plane)
    fail "Plane not at airport!" if !@planes.include?(plane)
    @planes.delete(plane)
  end

end
