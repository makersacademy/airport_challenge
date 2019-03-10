class Airport
  attr_accessor :stormy, :capacity, :planes
  DEFAULT_CAPACITY = 100
  def initialize
    @stormy = false
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  def stormy?
    @stormy
  end

  def land(plane)
    fail "The plane can't be landed - it is stormy" if @stormy == true
    fail "The plane can't land - the airport is full" if @planes.count >= 100
    @planes << plane
  end

  def take_off(plane)
    fail "The plane can't take off - it is stormy" if @stormy == true
    @planes.pop
  end
end
