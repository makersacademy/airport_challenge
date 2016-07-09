require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 100

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
  end

  # come back and sort this out
  def stormy
    @stormy = true
  end

  def land(plane)
    raise "Abort landing. Stormy weather." if @stormy
    "Plane #{plane} has landed."
  end

  def take_off(plane)
    raise "Abort take off. Stormy weather." if @stormy
    "Plane #{plane} is in the air."
  end

end
