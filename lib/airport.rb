require_relative 'plane'

DEFAULT_CAPACITY = 20

class Airport

attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "Unsafe conditions, landing not permitted" if stormy
    raise "Airport is full, landing unauthorised" if full
    @planes << plane
  end

  def take_off(plane)
    raise "Unsafe conditions, take-off not permitted" if stormy
    @planes.delete(plane)
  end

  def stormy
    [true, false, false, false, false].sample
  end

  def full
    @planes.count >= @capacity
  end

end
