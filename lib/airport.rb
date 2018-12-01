class Airport

  attr_reader :hanger

  def initialize
    @hanger = []
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
