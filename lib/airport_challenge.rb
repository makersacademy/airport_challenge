require_relative "plane"

class Airport
  DEF_CAPACITY = 20

  def initialize(capacity = DEF_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "This airport is full." if full?

    raise "Too stormy to land." if stormy?

    @planes << plane
  end

  def takeoff(plane)
    raise "Too stormy for takeoff." if stormy?

    @planes.delete(plane)
  end

  attr_reader :planes
  attr_reader :capacity
  attr_accessor :stormy

  private
  def full?
    @planes.length == @capacity
  end

  def stormy?
    x = rand(100)
    1 == x
  end
end
