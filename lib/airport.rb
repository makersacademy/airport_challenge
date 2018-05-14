class Airport
  attr_reader :planes, :capacity

  CAPACITY = 20

  def initialize
    @planes = []
    @capacity = CAPACITY
  end

  def land(plane)
    @planes.push(plane)
  end

  def take_off(plane)
    @planes.push(plane)
  end

end
