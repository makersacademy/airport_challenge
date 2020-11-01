require 'plane'

class Airport
  DEFAULT_CAPACITY = 186
  attr_reader :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def landing(plane)
    raise "NO SPACE" if hangar.length >= capacity
    @hangar << plane
  end

  def take_off(plane)
    hangar.delete(plane)
  end
end
