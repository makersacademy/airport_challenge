require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 100

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    fail "Airport full" if airport_full?
    @planes << plane
  end

  def take_off
    "take off"
  end

  def not_at_airport?
    true
  end

  def airport_full?
    @planes.count >= DEFAULT_CAPACITY
  end

end
