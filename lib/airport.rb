require_relative 'plane'

class Airport

  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def take_off(plane)
    @planes.pop
  end

  def land(plane)
    fail "Airport full!" if full?
    @planes << plane
  end

  private
  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

end
