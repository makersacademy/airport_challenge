require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport is full" if full?

    fail "This plane has already landed" if duplicate? plane

    plane.set_as_landed
    planes << plane
  end

  def takeoff
    fail "No planes are at the airport" if empty?

    planes[-1].set_as_flying
    planes.pop
  end

  private

  def full?
    planes.count >= capacity
  end

  def duplicate?(value_to_check)
    planes.include? value_to_check
  end

  def empty?
    planes.empty?
  end
end
