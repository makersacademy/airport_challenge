require_relative 'plane'

class Airport

  attr_accessor :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def try_allow_landing(plane)
    raise "No space available" if full?
    @planes << plane
  end

  def try_allow_take_off(plane)

  end

  def full?
    @planes.length == @capacity
  end

end
