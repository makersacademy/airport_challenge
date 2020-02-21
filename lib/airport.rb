class Airport
  attr_reader :planes
  CAPACITY = 5
  
  def initialize
    @planes = []
    @capacity = CAPACITY
  end

  def capacity(num)
    @capacity = num
  end

  def land(plane)
    fail "The airport is full" if @planes.count >= @capacity
    @planes << plane
  end

  def take_off(plane)
    @planes.count > 0 ? "The plane has taken off" : (fail "no planes to take off")
  end

  private
  def stormy?
    rand(6) == 5
  end

end

class Plane
end
