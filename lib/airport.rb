require './lib/plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
    @capacity = 2
  end

  def land(plane)
    fail 'Airport full!' if @planes.count == @capacity
    fail 'Plane already landed!' if @planes.include? plane
    @planes << plane
    plane.land
    plane
  end

  def takeoff(plane)
    fail 'Airport empty!' if @planes.empty?
    fail 'Plane already airborne!' unless @planes.include? plane
    planes.delete(plane)
    plane.takeoff
    plane
  end

  private
  attr_reader :weather

end
