require './lib/plane'

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :planes, :capacity

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def new_capacity=(capacity)
    @capacity = capacity
  end

  def stormy?
    (rand(50) == 25) ? @stormy = true : @stormy = false
  end

  def land(plane)
    if stormy?
      fail "It is stormy"
    elsif @planes.length >= DEFAULT_CAPACITY
      fail "This airport is full"
    elsif @planes.include?(plane)
      fail "This plane is landed"
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
