class Airport
  attr_reader :planes, :capacity
  def initialize
    @planes = []
    @capacity = 20
  end

  def land plane
    fail "Sorry you can't land, the Airport is full" if planes.count == capacity
    plane.land
    planes << plane
  end

  def take_off plane
    plane.take_off
    planes.delete plane
  end
end
