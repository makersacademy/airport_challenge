
class Plane

  DEFAULT_CAPACITY = 500

  attr_accessor :capacity, :origin, :destination

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @flying = true
    @origin = nil
    @destination = nil
  end

  def arrival
    @flying = false
  end

  def departure
    @flying = true
  end

  def flying?
    @flying
  end

end
