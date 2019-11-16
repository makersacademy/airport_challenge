class Airport
  DEFAULT_CAPACITY = 50

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "The airport is full" if full?
    @planes.push(plane)
  end

  def take_off
    fail "The airport is empty" if empty?
    @planes.pop
  end

  private

  def full?
    @planes.count == @capacity
  end

  def empty?
    @planes.empty?
  end
end
