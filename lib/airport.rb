require 'plane'

class Airport
  DEFAULT_CAPACITY = 186
  attr_reader :hangar

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def landing(plane)
    raise "NO SPACE" if hangar.length >= 186
    @hangar << plane
  end

  def take_off(plane)
    hangar.delete(plane)
  end
end
