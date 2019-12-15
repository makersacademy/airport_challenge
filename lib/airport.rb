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

    @planes << plane
  end

  def take_off(plane)
  end

  private

  def full?
    @planes.count >= @capacity
  end

end
