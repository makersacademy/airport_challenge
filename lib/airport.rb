class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :planes
  # attr_writer :capacity
  def initialize
    @planes = []
  end

  def land(plane)
    fail 'Airport Full' if full?
    fail 'No Landing Due To Storm' if stormy?
    plane.land
    planes << plane
    plane
  end

  def take_off
    fail 'No Take Off Due To Storm' if stormy?
    plane = planes.pop
    plane.fly
  end

  def full?
    planes.length >= DEFAULT_CAPACITY
  end

  def stormy?
  end
end
