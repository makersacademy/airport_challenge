class Airport
  DEFAULT_CAPACITY = 50

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "The airport is full" if @planes.length == @capacity
    @planes.push(plane)
  end

  def take_off
    fail "The airport is empty" if @planes == []
    @planes.pop
  end
end
