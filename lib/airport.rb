require_relative 'plane'

class Airport
  attr_reader :hangar, :capacity

  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport full' if full?
    @hangar << plane
  end

  def takeoff(plane)
    @hangar.delete(plane)
  end

  private

  def full?
    @hangar.length >= @capacity
  end
end
