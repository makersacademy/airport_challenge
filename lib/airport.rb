class Airport
  DEFAULT_MAX_PLANES = 10

  def initialize
  	@capacity = DEFAULT_MAX_PLANES
    @plane = []
  end

  attr_accessor :capacity

  def landing(plane)
  	fail "Cannot land, airport full" if full?
  	@plane << plane
  end

  def take_off
  	@plane.pop
  end

  def empty?
  	@plane.length <= 0
  end

  def full?
  	@plane.length >= capacity
  end
end
