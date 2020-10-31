require_relative 'plane'

class Airport
  attr_reader :plane

  def initialize
    @plane = []
  end

  def land(plane)
    raise "Airport full! You cannot land here!" if @plane.count >= 20

    @plane << plane
  end

  def takeoff(plane)
    @plane - [plane]
  end
end
