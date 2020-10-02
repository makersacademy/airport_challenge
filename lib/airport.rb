require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 100
  attr_reader :spaces, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @spaces = []
  end

  def land(plane)
    raise "Airport full, landing denied." if full?

    raise "Plane already landed" unless plane.in_air?

    plane.grounded
    spaces << plane
  end

  def takeoff(plane)
    raise "There are no planes to take off" if empty?

    raise "Plane already flying" if plane.in_air?

    plane.flying
    spaces.delete(plane)
  end

  private
  def full?
    spaces.count == capacity
  end

  def empty?
    spaces.count.zero?
  end
end
