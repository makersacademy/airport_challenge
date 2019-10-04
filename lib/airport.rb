require_relative 'airplane'
class Airport

  DEFAULT_CAPACITY = 20
  attr_reader :plane
  attr_accessor :airport_capacity

  def initialize(airport_capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = airport_capacity
  end

  def takeoff
    fail 'No planes in airport' if @planes.empty?

    @planes.pop
  end

  def land(plane)
    fail 'airport is full' if @planes.count >= airport_capacity

    @planes << plane
  end
end
