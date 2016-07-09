class Airport
DEFAULT_CAPACITY = 3

  attr_reader :hanger
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport Full' if full?
    plane.down
    hanger << plane
  end

  def take_off(plane)
    plane.up
    hanger.pop
  end

  private

  def full?
    hanger.size >= capacity
  end
end
