class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane, stormy = false)
    fail "This airport is full" if full?
    fail "Stormy weather, can't land" if stormy
    @planes << plane
    @planes.last
  end

  def takeoff(plane, stormy = false)
    fail "Stormy weather, can't take off" if stormy
    @planes.pop
  end

  private
  def full?
    if @planes.count == @capacity
      true
    else
      false
    end
  end
end
