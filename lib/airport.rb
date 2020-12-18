class Airport

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
    fail 'Airport is full' if @plane
    @plane = plane
  end

  def hangar
    @planes
  end

  def take_off(plane)
    @planes.delete(plane)
  end
end
