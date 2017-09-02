require_relative 'plane'

class Airport
DEFAULT_CAPACITY = 20
attr_reader :capacity

  def initialize(cap = DEFAULT_CAPACITY)
    @capacity = cap
  end

  def land(plane)
    plane
  end

  def take_off(plane)
  end

end
