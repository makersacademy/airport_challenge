require './lib/plane'

class Airport

  DEFAULT_CAPACITY = 1

  attr_reader :planes, :capacity

  def initialize
    @planes = []
    @stormy = false
    @capacity = DEFAULT_CAPACITY
  end

  def new_capacity=(capacity)
    @capacity = capacity
  end

  def stormy?
    (rand(50) == 4) ? @stormy = true : @stormy = false
  end

  def land(plane)
    if stormy?
      fail "It is stormy"
    elsif @planes.length >= DEFAULT_CAPACITY
      fail "This airport is full"
    else
      @planes << plane
    end
  end

  def takeoff(plane)
    if stormy?
      fail "It is stormy"
    else
      @planes.pop
    end
  end
end
