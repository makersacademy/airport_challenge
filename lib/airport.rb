class Airport
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
    "The plane has taken off"
  end
end

class Plane
end
