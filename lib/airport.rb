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

  def land(plane)
    case
    when stormy? then fail "It is stormy"
    when full? then fail "This airport is full"
    when plane.flying == false then fail "This plane is landed"
    else @planes << plane
    end
  end

  def takeoff(_plane)
    if stormy?
      fail "It is stormy"
    else
      @planes.pop
    end
  end

  private

  def stormy?
    (rand(50) == 25) ? @stormy = true : @stormy = false
  end

  def full?
    @planes.length >= DEFAULT_CAPACITY
  end

end
