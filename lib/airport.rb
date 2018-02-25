class Airport
  attr_accessor :hanger
  def initialize
    @hanger = []
  end

  def land(plane)
    @hanger.push(plane)
    plane.status
  end

  def takeoff(plane)
    @hanger.delete(plane)
  end
end
