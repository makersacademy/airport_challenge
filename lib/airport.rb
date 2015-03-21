class Airport
  attr_reader :planes
  def initialize(settings = {})
    @planes = []
    @capacity = settings.fetch(:capacity, 6)
  end

  def land plane
    Raise LandingUnsafeError 'Airport full' if full?
    planes << plane
    plane.land
  end

  def full?
    planes.length == @capacity
  end

  def take_off plane
    planes.delete(plane)
    plane.take_off
  end
end
