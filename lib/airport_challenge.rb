require_relative "plane"

class Airport
  DEF_CAPACITY = 20

  def initialize(capacity = DEF_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "This airport is full." if full?
    
    @planes << plane
  end

  def takeoff(plane)
    @planes.delete(plane)
  end

  attr_reader :planes
  attr_reader :capacity

  private
  def full?
    @planes.length == @capacity
  end
end
