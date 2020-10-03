require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "This airport is full." if @planes.size >= @capacity

    @planes << plane
  end

  def take_off
    @planes[-1].flying
    @planes.pop
  end
end
