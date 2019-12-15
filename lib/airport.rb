require_relative "plane"

class Airport

  DEFAULT_CAPACITY = 20
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  def land(plane)
    fail "Error, airport full!" if full?
    
    fail "Error, too stormy!" if stormy?

    @planes << plane
  end

  def take_off(plane)
    # @planes.pop
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def stormy?
    rand(1..10) > 8
  end
end
