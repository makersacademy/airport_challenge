require './lib/plane'

class Airport

  DEFAULT_AIRPORT_CAPACITY = 10

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_AIRPORT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Airport is full" if @planes.size >= @capacity
    @planes << plane
  end

  def take_off(plane)
    @planes[1..-1]
  end
end
