class Airport
  DEFAULT_CAPACITY = 10
  
  attr_accessor :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "Airport is full." if full?
    @planes << plane

    # fail "Weather is stormy. You can't land the plan" if stormy?
  end

  def take_off(plane)
    @planes.delete(plane)

    # fail "Weather is stormy. You can't take off the plan" if stormy?
  end

  def full?
    return true if @planes.count >= @capacity
    return false if @planes.count < @capacity
  end

  def stormy?
    if rand(4) == 0
      true
    else
      false
    end
  end
end
