require_relative 'plane'

class Airport
  attr_reader :hangar, :capacity

  def initialize(capacity = 10)
    @capacity = capacity
    @hangar = []
  end

  def approve_landing(plane)
    fail "Airport is at maximum capacity" if max_capacity?

    hangar << plane
  end

  def approve_take_off(plane)
    hangar.delete(plane)
  end

  def in_hangar?(plane)
    hangar.include?(plane)
  end

  private

  def max_capacity?
    hangar.count == capacity
  end
end
