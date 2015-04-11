class Airport
  attr_reader :planes, :capacity

  def initialize
    @planes = []
    @capacity = 20
  end

  def land plane
    fail 'Airport is full, cannot land.' if full?
    plane.land!
    planes << plane
  end

  def take_off plane
    plane.take_off
    planes.delete plane
  end

  def full?
    planes.count == capacity
  end

end
