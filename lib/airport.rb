class Airport

  DEFAULT_CAPACITY = 20
  attr_accessor :capacity
 
  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def full
    return true if planes.count == capacity
    false
  end

  def dock(plane)
    planes.push(plane)
  end

  def undock(plane)
    planes.delete(plane)
  end

  private
   attr_reader :planes

end