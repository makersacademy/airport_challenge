require_relative 'airplane'
class Airport

  DEFAULT_CAPACITY = 20
  attr_reader :plane
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def takeoff
    fail 'No planes in airport' if @planes.empty?

    @planes.pop
  end

  def land(plane)
    fail 'airport is full' if @planes.count >= @capacity

    @planes << plane
  end
end
