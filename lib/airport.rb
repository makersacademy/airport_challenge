require_relative 'plane'

class Airport
  attr_reader :hangar
  attr_accessor :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
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
