class Airport

  attr_reader :hanger
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
  end

  def land(plane)
    fail "The hanger is full." unless @hanger.length < @capacity 
    @hanger.push(plane)
    @hanger
  end

  def takeoff(plane)
    @hanger.delete(plane)
  end

end

class Plane

end
