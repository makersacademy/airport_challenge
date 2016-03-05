require_relative 'plane'

class Airport

  attr_reader :planes
  attr_reader :capacity

  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def instruct_land(plane)
    raise "The airport is full." if full?
    plane.landed?
    @planes << plane
    plane
  end

  def instruct_takeoff
      plane = @planes.pop
      @planes.delete(plane)
    end

private

def full?
  @planes.size >= @capacity
end

def empty?
  @planes.size == 0
end

end
