class Airport
  DEFAULT_CAPACITY = 20
  attr_writer :capacity

  def capacity(capacity)
    if capacity < @planes.length
      fail "There are currently too many planes in the airport for the requested capacity."
    end
    @capacity = capacity
  end

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Error; Plane ID #{plane} has already landed in Airport ID #{self}." if in_airport?(plane)
    fail "Airport is full." if @planes.length >= @capacity
    fail "Can not land during stormy weather." if stormy?
    @planes.push(plane)
    "Plane ID #{plane} has landed."
  end

  def take_off(plane)
    fail "Error; Plane ID #{plane} is not in Airport ID #{self}." unless in_airport?(plane)
    fail "Can not take off during stormy weather." if stormy?
    @planes.delete(plane)
    "Plane ID #{plane} has taken off."
  end

  def in_airport?(check_plane)
    @planes.each do |plane|
      return true if plane == check_plane
    end
    return false
  end

  def stormy?
    return true if rand(10) == 9
    return false
  end

end