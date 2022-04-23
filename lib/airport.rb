class Airport
  
  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail "Airport is full" if full?
    @planes << plane
  end

  def take_off(plane)
    p @planes.delete(plane)

  end

  def full?
    return true if @planes.count >= 10
    return false if @planes.count < 10
  end
end
