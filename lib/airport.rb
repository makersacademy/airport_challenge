class Airport

  attr_reader :hanger
  DefaultCapacity = 5

  def initialize(capacity = DefaultCapacity)
    @hanger = []
    @capacity = capacity
  end

  def land(plane)
    @hanger.push(plane)
    @hanger
  end

  def takeoff(plane)
    @hanger.delete(plane)
  end

end

class Plane

end
