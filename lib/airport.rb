require_relative 'plane'

class Airport

  attr_reader :capacity, :hangar
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    fail "Unsafe. Due to the storm #{plane} can not land" if plane.stormy?
    fail "Airport is full" if full?
    @hangar << plane
    "The following plane: #{plane} has landed"
  end

  def take_off(plane)
    fail "Unsafe. Due to the storm #{plane} can not take off" if plane.stormy?
    "The following plane: #{plane} has taken off"
  end

private

  def full?
    @hangar.count >= @capacity
  end

end
