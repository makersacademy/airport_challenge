require './lib/plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
    @capacity = 1
  end

  def land(plane)
    fail 'Airport full!' if @planes.count == @capacity
    @planes << plane
    plane.land
    plane
  end

  def takeoff(plane)
    fail 'Airport empty!' if @planes.empty?
    planes.delete(plane)
    plane.takeoff
    plane
  end

end
