class Airport
  def initialize
    @planes = []
    @capacity = 5
  end

  def land(plane)
    raise "The airport has no capacity." if full?
    plane.flying = false
    @planes << plane
    "Landed successfully"
  end

  def take_off
    plane = @planes.pop
    plane.flying = true
    return plane
  end

  private
  
  def full?
    @planes.count >= @capacity
  end

end
