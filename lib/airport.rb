require_relative 'plane'

class Airport

  attr_accessor :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def full?
    @planes.length == @capacity
  end

end
