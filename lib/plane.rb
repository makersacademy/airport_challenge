
class Plane

  DEFAULT_CAPACITY = 500

  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @flying = true
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
