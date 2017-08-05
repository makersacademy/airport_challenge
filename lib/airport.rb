class Airport

  attr_accessor(:planes)

  def initialize(capacity = 2)
    @planes ||= []
    @capacity = capacity
  end

  def open?
    true
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    @planes.delete(plane)
  end

  def full?
    @planes.count >= @capacity
  end

end
