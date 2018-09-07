class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    fail 'Airport full' if full?
    @hangar << plane
  end

  def takeoff(plane)
    @hangar.delete(plane)
  end

  def full?
    @hangar.length >= 1
  end
end
