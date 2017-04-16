
class Plane

  DEFAULT_CAPACITY = 500

  attr_accessor :capacity, :origin, :destination

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @flying = true
    @origin = nil
    @destination = nil
  end

  def flying?
    @flying
  end

  # private
  #
  # attr_reader :arrival, :departure

  def arrival
    @flying = false
  end

  def departure
    @flying = true
  end
end
